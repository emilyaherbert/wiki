### 🏛️ # 2: the Fuel Virtual Machine

<p class="size">the link between the Fuel UTXO-based parallel execution transaction design and the developer</p>

<ul class="smallersize">
    <li>the FuelVM learns from the past to build something better</li>
    <li>designed from the ground up to optimized for UTXO-based architecture and fraud-provability</li>
    <li>designed from the ground up to be vertically integrated with the Fuel toolchain</li>
</ul>

---

<p class="size">similarities to the EVM:</p>
<ul class="smallersize">
    <li>similar model for contracts and cross-contract calls</li>
    <li>contracts may call other contracts with a CALL (similar to message call)</li>
</ul>

<p class="size">differences from the EVM:</p>
<ul class="smallersize">
    <li>built-in support for working with custom native assets (including ETH!)</li>
    <li>the FuelVM has scripts, removing the need for approve/transferFrom</li>
    <li>globally shared memory architecture instead of context-local memory</li>
    <li>implements several EIPs that the EVM is not able to implement</li>
    <li>and more!</li>
</ul>

Note:

Fuel uses a similar model to Ethereum for contracts and cross-contract calls. Contracts may call other contracts with a CALL (similar to an Ethereum message call). Unlike the EVM, which can only forward its base asset with a call (i.e. ETH), the FuelVM can forward a single native fungible asset with a call.

Transactions may initiate contract calls. Ethereum transactions may call a single contract directly. Fuel transactions instead execute a script (arbitrary bytecode attached to the transaction), which may call any number of contracts.

* The EVM is a complicated machine to construct fraud proofs for. It usually requires a second layer such as WASM or MIPS to be interpreted into a fraud provable system


* Fuel uses a system of UTXOs which enable a more efficient system fo transfer and ownership of assets, where the accounts tree doesn't have to be rebuilt every time funds are transferred.


* - a contract can only mint and burn its own native token
  - a contract can receive and transfer any native asset, including its own

* Instead of every contract call having its own separate memory space, call data, and return data, all contract call frames share global memory
* This chunk of memory is shared amongst all call frames and is globally readable
* This allows you to pass data around between contracts without expensive storage and pass chunks of data without having to serialize, copy from call data to memory, etc

* Modern processors have 64-bit registers, and all of the instruction set operates on 64 bits. Those are the most efficient instructions

* Register-based VMs typically require fewer instructions to do the same work than stack-based VMs. Because every operation is priced, optimizing to reduce the number of operations needed to do the same amount of work has outsized benefits.

---

<div class="container">

<div class="col">
<h3>🏛️ # 2:</h3>

<p class="size">
the Fuel Virtual Machine
</p>
</div>

<div class="col">
<table>
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
