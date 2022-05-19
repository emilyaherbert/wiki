contract;

storage {
    apples: u64
}

abi CounterContract {
    #[storage(write)]
    fn initialize();
    #[storage(read, write)]
    fn increment(n: u64);
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
}


