contract;

use std::chain::*;
use std::storage::*;
use std::constants::*;

abi TestContract {
    fn initialize_counter(gas: u64, amount: u64, coin: b256, value: u64) -> u64;
    fn increment_counter(gas: u64, amount: u64, coin: b256, amount: u64) -> u64;
    fn decrement_counter(gas: u64, amount: u64, coin: b256, amount: u64) -> u64;
}

const SLOT = 0x0000000000000000000000000000000000000000000000000000000000000000;

impl TestContract for Contract {
    fn initialize_counter(gas: u64, amount: u64, coin: b256, value: u64) -> u64 {
        store(SLOT, value);
        value
    }

    fn increment_counter(gas: u64, amount: u64, coin: b256, amount: u64) -> u64 {
        let stored_val: u64 = get(SLOT);
        let value = stored_val + amount;
        store(SLOT, value);
        value
    }

    fn decrement_counter(gas: u64, amount: u64, coin: b256, amount: u64) -> u64 {
        // check
        let stored_val: u64 = get(SLOT);
        if stored_val < amount {
            panic(stored_val);
        };

        // interaction
        let other_contract = abi(TestContract, 0x3dba0a4455b598b7655a7fb430883d96c9527ef275b49739e7b0ad12f8280eae);
        other_contract.decrement_counter(gas, amount, coin, amount);

        // effect -- this violates the CEI pattern
        let new_amount = stored_val - amount;
        store(SLOT, new_amount);
        new_amount
    }
}



