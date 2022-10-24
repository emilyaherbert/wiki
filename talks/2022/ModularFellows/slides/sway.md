<div class="container">

<div class="col">
<h3>🏛️ # 3:</h3>

<p class="size">
superior developer experience (with Sway and Forc)
</p>
</div>

<div class="col">
<table>
    <tr>
        <td>
            <div class="container">
                <div class="col">Sway and Forc</div>
                <div class="col">
                    <img src="./images/sway_logo.png" width=50px class="circular--square"/>
                </div>
            </div>
            <p class="smallersize">
            smart-contract language and developer experience
            </p>
            <p class="smallersize">
            ⚡ in active development ⚡
            </p>
        </td>
    </tr>
    <tr>
        <td>
            <img src="./images/right_arrow.png" width=25px alt="<-" style="filter: invert(70%); transform: rotate(90deg);"/>
        </td>
    </tr>
    <tr>
        <td>
        FuelVM
        <p class="smallersize">
        blockchain-optimized VM
        </p>
        </td>
    </tr>
    <tr>
        <td>
            <img src="./images/right_arrow.png" width=25px alt="<-" style="filter: invert(70%); transform: rotate(90deg);"/>
        </td>
    </tr>
    <tr>
        <td>
            <div class="container">
                <div class="col">Fuel</div>
                <div class="col">
                    <img src="./images/fuel_logo.png" width=50px alt="Fuel Labs logo"/>
                </div>
            </div>
            <p class="smallersize">
            the fastest modular execution layer
            </p>
        </td>
    </tr>
</table>
</div>

</div>

---

<img src="./images/solidity_logo.png" width=400px alt="Solidity" style="filter: invert(70%);"/>

Note:

Language for creating smart contracts:
* Developed for early EVM
* Feels similar to JavaScript
* Domain-specific for smart contracts

but it has some issues…
* Solidity docs don't tell you how to do contracts end-to-end
* Fragmented ecosystem + tooling
* Lacks many critical safety guarantees

wide classes of bugs:
* Reentrancy issues
* Magic values used for errors
* “stack too deep" errors...

The compiler doesnt catch these things

it works but, it was not designed with the knowledge of the modern blockchain paradigms that you and I know today

---

<div class="container">
  <div class="col">
    <img src="./images/cpp_logo.png" height=400px alt="C++"/>
  </div>
  <div class="col">
    <img src="./images/rust_logo.png" height=350px alt="Rust"/>
  </div>
</div>

Note:

C++ is powerful and allows users to manage memory themselves, but creates a wide class of memory management bugs

Chromium did an analysis of all of the serious security bugs, and found that 70% were memory management bugs (i.e. bugs involving pointers)

Rust also:
* Part of developer-focused ecosystem
* Verbose and friendly compiler
* Has extensive toolchain

Motivated by both Solidity and Rust:
Combines first-class smart contract and blockchain support
With the design philosophy of Rust

---

<img src="./images/sway_logo.png" height=400px alt="Sway" class="circular--square"/>

Note:

Motivated by both Solidity and Rust:
Combines first-class smart contract and blockchain support
With the design philosophy of Rust

---

<div class="container">
  <div class="col">
    <img src="./images/solidity_logo.png" height=200px alt="Solidity" style="filter: invert(70%);"/>
  </div>
  <div class="col">
    <img src="./images/right_arrow.png" height=100px alt="->" style="filter: invert(70%);"/>
  </div>
  <div class="col">
    <img src="./images/sway_logo.png" height=200px alt="Sway" class="circular--square"/>
  </div>
</div>

<dl class="size">
    <dd>“domain-specific”</dd>
    <dd>first-class smart contracts</dd>
    <dd>blockchain support</dd>
    <dd>contract storage as language construct</dd>
    <dd>sharable contract interfaces</dd>
</dl>

---

<div class="container">
  <div class="col">
    <img src="./images/sway_logo.png" height=200px alt="Sway" class="circular--square"/>
  </div>
  <div class="col">
    <img src="./images/right_arrow.png" height=100px alt="->" style="filter: invert(70%); transform: rotate(180deg);"/>
  </div>
  <div class="col">
    <img src="./images/rust_logo.png" height=200px alt="Rust"/>
  </div>
</div>

<dl class="size">
    <dd>“feels like Rust”</dd>
    <dd>static types with trait-based inheritance</dd>
    <dd>verbose and friendly compiler</dd>
    <dd>unified tooling and developer experience</dd>
    <dd>team organization</dd>
</dl>

Note:

Plus, because its written in Rust:
* fast and efficient
* easily auditable

---

### Sway feels like Rust?

---

<p class="size">
variables:
</p>

<img src="./images/sway_variables.png" height=150px />

<p class="size">
functions:
</p>

<img src="./images/sway_functions.png" height=150px />

---

<p class="size">
if expressions:
</p>

<div class="container">
  <div class="col">
    <img src="./images/sway_if_expression_1.png" height=200px/>
  </div>
  <div class="col">
    <img src="./images/sway_if_expression_2.png" height=200px/>
  </div>
</div>

Note:

Expressions are not statements, this allows conditional direct assignment of variables

Emphasize point about variable assignments

---

<p class="size">
match expressions:
</p>

<div class="container">
  <div class="col">
    <img src="./images/sway_match_expression_1.png" height=200px/>
  </div>
  <div class="col">
    <img src="./images/sway_match_expression_2.png" height=200px/>
  </div>
</div>

Note:

Unlike switch case, which doesnt check control flow. Solidity only has if-else

---

<p class="size">
structs (with methods):
</p>

<img src="./images/sway_struct.png" height=400px />

---

<p class="size">
enums (sum types):
</p>

<img src="./images/sway_enum.png" height=400px />

---

<p class="size">
generic types and type inference:
</p>

<img src="./images/sway_generic_types.png" height=400px />

---

<p class="size">
error handling:
</p>

<img src="./images/sway_error_handling.png" height=300px />

Note:

Sway also has panic and revert

---

### Sway is domain-specific?

---

<p class="size">
Sway primitive types:
</p>

<ul class="smallersize">
    <li>unsigned integers</li>
    <li>booleans</li>
    <li>static-length strings</li>
    <li>32-byte values</li>
    <li>single-byte values</li>
    <li>the unit type</li>
</ul>

Note:

Plus tuple types and user-defined structs and enums

---

<p class="size">
first-class contracts:
</p>

<img src="./images/sway_contract.png" height=300px />

Note:

Define contract ABI separately
* This makes it shareable,
* Can be exported and imported like a library

---

<p class="size">
calling contracts:
</p>

<img src="./images/sway_abi.png" height=100px />

<img src="./images/sway_calling_contract.png" height=250px />

---

<p class="size">
contract storage:
</p>

<img src="./images/sway_storage.png" height=300px />

Note:

The annotation provides some guarantees:
* you will not incur excessive storage gas costs
* the compiler can apply additional optimizations
* generally easy to reason about and audit.
* Prevents ambiguity between if you are accessing storage or if you are accessing local variable

---

<p class="size">
and much more:

[fuel.network](https://fuel.network/)
</p>

<img src="./images/sway_book.png" height=500px />