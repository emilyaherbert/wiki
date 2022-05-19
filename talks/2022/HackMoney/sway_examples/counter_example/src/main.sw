contract;

storage {
    apples: u64
}

abi CounterContract {
    fn initialize();
    fn increment(n: u64);
    fn get() -> u64;
}

impl CounterContract for Contract {
    fn initialize() {
        storage.apples = 0;
    }

    fn increment(n: u64) {
        storage.apples = storage.apples + n;
    }

    fn get() -> u64 {
        storage.apples
    }
}


