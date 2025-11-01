/*
/// Module: tip_jar
module tip_jar::tip_jar;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module tip_jar::tip_jar;

use sui::coin::{Self, Coin};
use sui::event;
use sui::sui::SUI;

// Error codes
const EInvalidTipAmount: u64 = 1;

public struct TipJar has key {
    id: UID,
    owner:address,
    total_tip_received:u64,
    tip_count:u64,
}

public struct TipJarCreated has copy,drop {
    owner: address,
    tip_jar_id:ID,
}

public struct TipSent has copy, drop {
    tipper: address,
    amount: u64,
    total_tips: u64,
    tip_count: u64,
}

//main function asszem
fun init(ctx: &mut TxContext) {
    let owner: address = ctx.sender();
    let tip_jar: TipJar = TipJar{
    id: object::new(ctx: ctx),
    owner: owner,
    total_tips_received: 0,
    tip_count: 0,
    }
}