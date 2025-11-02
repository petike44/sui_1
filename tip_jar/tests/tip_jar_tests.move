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
    }
}