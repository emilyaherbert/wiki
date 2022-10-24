### 🏛️ # 3: superior developer experience

<p class="size">devex-first, from the start</p>

<ul class="smallersize">
    <li>Sway is a Rust-inspired smart contract language</li>
    <li>the FuelVM is vertically integrated with tooling and a companion language, Sway</li>
    <li>the Fuel Toolchain is a full stack of tools for enabling/assisting the Fuel application development experience</li>
</ul>

<p><img src="./images/sway_logo.png" height=200px alt="Sway" class="circular--square"/></p>
<p class="smallersize">(^^^ Sway logo)</p>

Note:

* One common issue developers face when working within the Ethereum ecosystem is how to choose a set of tools to get started
* leaving the job of creating accessible, high-level tooling to the community
* Developers can get everything they need to start creating Sway applications for the Fuel VM with a single toolchain, blessed by the same teams that create the FuelVM and Sway language.
* Fuel Labs take a curated, "batteries-included"-yet-modular approach to providing tooling
* We aim to provide a comprehensive, standardized, canonical set of tools that cover not only the lower levels of the stack (like protocol and VM implementations) but the higher level too (such as package management, editor support, common-use plugins and much more)

---

### Sway:

<div class="container">
  <div class="col">
    <img src="./images/solidity_logo.png" height=250px alt="Solidity" style="filter: invert(70%);"/>
  </div>
  <div class="col">
    <img src="./images/right_arrow.png" height=100px alt="->" style="filter: invert(70%);"/>
  </div>
  <div class="col">
    <img src="./images/sway_logo.png" height=200px alt="Sway" class="circular--square"/>
    <p class="smallersize">first-class smart contract and blockchain support</p>
    <dl class="smallersize">
        <dd>“domain-specific”</dd>
        <dd>first-class smart contracts</dd>
        <dd>blockchain support</dd>
        <dd>contract storage as language construct</dd>
        <dd>sharable contract interfaces</dd>
    </dl>
  </div>
</div>

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
    <img src="./images/sway_logo.png" height=200px alt="Sway" class="circular--square"/>
    <p class="smallersize">the design philosophy of Rust</p>
    <dl class="smallersize">
        <dd>“feels like Rust”</dd>
        <dd>static types with trait-based inheritance</dd>
        <dd>verbose and friendly compiler</dd>
        <dd>unified tooling and developer experience</dd>
        <dd>team organization</dd>
    </dl>
  </div>
  <div class="col">
    <img src="./images/right_arrow.png" height=100px alt="->" style="filter: invert(70%); transform: rotate(180deg);"/>
  </div>
  <div class="col">
    <img src="./images/rust_logo.png" height=200px alt="Rust"/>
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

Plus, because its written in Rust:
* fast and efficient
* easily auditable

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

### The Fuel toolchain:

<p class="size">tooling:</p>

<ul class="smallersize">
    <li>`forc`: fuel project orchestrator</li>
    <li>`fuel-core`: FuelVM node client</li>
    <li>Fuel indexer: used to index components of the blockchain</li>
</ul>

<p class="size">plugins and more tooling!</p>

<ul class="smallersize">
    <li>`forc-fmt`: Sway code formatter</li>
    <li>`forc-lsp`: Sway Language Server Protocol implementation</li>
    <li>`forc-explore`: Fuel block explorer</li>
    <li>`forc-client`: for deploying and running Sway apps via the CLI</li>
    <li>`forc-wallet`: initializing a wallet, adding accounts and signing transactions</li>
    <li>`fuelup`: Fuel toolchain manager</li>
</ul>

<p class="size">and VSCode and vim plugins 😊</p>

---

<div class="container">

<div class="col">
<h3>🏛️ # 3:</h3>

<p class="size">
superior developer experience
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
