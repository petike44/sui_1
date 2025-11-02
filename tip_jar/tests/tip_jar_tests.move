// 1_000_000_000 SUI = 1 SUI
// 500_000_000 SUI = 0.5 SUI
// 1_250_000_000 SUI = 1.25 SUI

#[test_only]
module tip_jar::tip_jar_tests {
    use sui::test_scenario::{Self}
    use sui::coin::{Self, Coin};
    use sui::sui::SUI;
    use tip_jar::tip_jar::{Self, TipJar};

    const OWNER: address = @0xA11CE;
    const TIPPER_1: address = @0xB0B;
    const TIPPER_2: address = @0xCAFE;

    fun create_test_coin(amount: u64, ctx: &mut TxContext): Coin<SUI> {
        coin::mint_for_testing<SUI>(amount, ctx) 
    }

    #[test]
    fun test_init_creates_tip_jar() {
        let mut scenario = test_scenario::begin(OWNER);
        let ctx: test_scenario::ctx(&mut scenario);

       let tip_jar::init_for_testing(ctx);

       test_scenario::next_tx(&mut scenario, OWNER);

       let tip_jar = test_sceanario::take_shared_object::<TipJar>(&mut scenario);

       assert!(tipjar::get_owner(&tip_jar)  == OWNER, 0);
       assert!(tipjar::get_total_tips(&tip_jar) == 0, 1);
       assert!(tip_jar::get_tip_count(&tip_jar) == 0, 2);
       assert!(tip_jar::is_owner(&tip_jar, OWNER) == true, 3);
       assert!(tip_jar::is_owner(&tip_jar, TIPPER_1) == false, 4);

       test_scenario::return_shared(tip_jar);
       test_scenario::commit(scenario);
    }
}

#[test]
fun test_send_tip_basic() {
    let mut scenario = test_scenario::begin(OWNER);
    
    {
        let ctx: test_scenario::ctx(&mut scenario);
        tip_jar::init_for_testing(ctx);
    };

    test_scenario::next_tx(&mut scenario, TIPPER_1);

    {
        let ctx: test_scenario::ctx(&mut scenario);
        let mut tip_jar = test_scenario::take_shared<TipJar>(&scenario);
        let tip_coin = create_test_coin(1_000_000_000, ctx);

        tip_jar::send_tip(&mut tip_jar, tip_coin, ctx);
        assert!(tip_jar::get_total_tips(&tip_jar) == 1_000_000_000, 0);
        assert!(tip_jar::get_tip_count(&tip_jar) == 1, 1);

        test_scenario::return_shared(tip_jar);
    };
    
    test_scenario::next_tx(&mut scenario, OWNER);
    {
        let received_coin = test_scenario::take_from_sender<Coin<SUI>>(&scenario);
        assert!(coin::value(&received_coin) == 1_000_000_000, 2);
        test_scenario::return_to_sender(&scenario, received_coin);
    };
    test_scenario::end(scenario);
}

