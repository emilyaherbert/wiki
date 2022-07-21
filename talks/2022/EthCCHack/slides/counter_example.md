### Building a "counter" example

<img src="./images/apple.png" height=200px/>

---

<p class="size">
install:
</p>

```bash
$ cargo install forc fuel-core
```

Note:

* "Fuel Orchestrator"
* Project + dependency management system
* Equivalent of Rust's Cargo

---

<p class="size">
create a new project:
</p>

```bash
$ forc init counter_example
$ cd counter_example
$ tree .
.
├── Cargo.toml
├── Forc.toml
├── src
│   └── main.sw
└── tests
    └── harness.rs
```

Note:

forc uses cargo under the hood

---

<p class="size">
Forc.toml:
</p>

<img src="./images/counter_toml.png" height=200px/>

---

<div class="container">
    <div class="col">
        <p class="size">
        main.sw:
        </p>
    </div>
    <div>
        <img src="./images/counter_contract.png" height=600px/>
    </div>
</div>

---

<div class="container">
    <div class="col">
        <p class="size">
        test harness:
        </p>
    </div>
    <div>
        <img src="./images/counter_test.png" height=600px/>
    </div>
</div>

---

<p class="size">
run the test:
</p>

```bash
$ forc test
  Compiled contract "counter_example".
  Bytecode size is 300 bytes.
   Compiling counter_example v0.1.0 

running 1 test
test increment_and_get ... ok
```

⭐ Done! ⭐

---

🤔 what if we make a mistake …. ? 🤔

<p class="size">
Sway can detect:
</p>

<ul class="smallersize">
    <li>programming errors</li>
    <li>blockchain-specific errors</li>
</ul>

Note:

Experimental branch for CEI pattern check

* Compiler messages are instructive and helpful
* Warnings and errors are specific to smart contracts
* Compiler detects smart contract bugs (e.g. reentrancy)
