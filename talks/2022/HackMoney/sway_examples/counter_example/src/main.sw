contract;

use std::result::*;

storage {
    apples: u64
}

abi CounterContract {
    #[storage(write)]
    fn initialize();
    #[storage(read, write)]
    fn increment(n: u64);
    #[storage(read, write)]
    fn decrement(n: u64) -> Result<u64, str[4]>;
    #[storage(read)]
    fn get() -> u64;
}

impl CounterContract for Contract {
    #[storage(write)]
    fn initialize() {
        storage.apples = 0;
    }

    #[storage(read, write)]
    fn increment(n: u64) {
        storage.apples = storage.apples + n;
    }

    #[storage(read)]
    fn get() -> u64 {
        storage.apples
    }

    #[storage(read, write)]
    fn decrement(n: u64) -> Result<u64, str[4]> {
        if storage.apples >= n {
            let new_value = storage.apples - n;
            storage.apples = new_value;
            Result::Ok(new_value)
        } else {
            Result::Err("fail")
        }
    }
}


