### Install Cargo

use rustup: [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)

---

### Install Forc

use fuelup: [https://tinyurl.com/install-fuelup](https://tinyurl.com/install-fuelup)

---

### 5 Minute Primer on Sway

`Forc`

<ul class="smallersize">
    <li>project and dependency management system</li>
    <li>compiling, building, deploying, testing, contracts</li>
    <li>starting local Fuel networks</li>
    <li>and more</li>
</ul>

---

to create a project:

```bash
$ forc new --name token --contract
$ cd token/
$ tree .
.
├── Cargo.toml
├── Forc.toml
├── src
│   └── main.sw
└── tests
    └── harness.rs
```

---

to build a project:

```bash
$ forc build
  Compiled library "core".
  Compiled library "std".
  Compiled contract "tmp".
  Bytecode size is 68 bytes.
```

to run the tests:

```bash
$ forc test
running 1 test
test can_get_contract_id ... ok
```

---

variable declarations:

```rust
let foo = 1;
let mut foo = 1;
let foo: u64 = 1;
```

functions:

```rust
fn function_name(param_1: u64, param_2: bool) -> str[4] {
    // body of the function
    "done"
}
```

---

contract ABI's:

```rust
abi SimpleAuction {
    fn bid();
}

impl SimpleAuction for Contract {
    fn bid() {
        // where things happen
    }
}
```

---

contract storage:

```rust
storage {
    my_data: u64 = 0
}

#[storage(read, write)]
fn update_data(new_data: u64) -> u64 {
    let old_data = storage.my_data;
    storage.my_data = new_data;
    old_data
}
```

---

`StorageMap`:

```rust
storage {
    my_map: StorageMap<u64, bool> = StorageMap {}
}

#[storage(write)]
fn insert_number(n: u64, on_or_off: bool) {
    storage.my_map.insert(n, on_or_off);
}

#[storage(read)]
fn get_from_number(n: u64) -> bool {
    storage.my_map.get(n)
}
```

<p class="size">
Want to know more about the design of Sway?

<a href="https://fuel.network/">fuel.network</a>
</p>