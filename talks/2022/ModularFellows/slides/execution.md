### 🏛️ # 1: parallel transaction execution

<p class="size">Fuel is designed to be fraud-provable, which enables support for trust-minimized light clients</p>

<p class="size">other blockchains have used honest-majority light clients:</p>

<div class="container">
<div class="col">
<img src="./images/client_network.png" height=350px/>
</div>
<div class="col">
<img src="./images/client_tradeoff.png" height=350px/>
</div>
</div>

<ul class="smallersize">
    <li>"an honest-majority light client is only secure if most validators are honest"</li>
    <li>"a full node is honest even if all validators are not honest"</li>
</ul>

Note:

* users must choose between high security and high computational resource usage and trusted security and low computational resource usage

Client:
* In the context of a blockchain, a client is a software that connects to other clients in a peer-to-peer manner
* Because all these clients talk to each other, they form a network where each client is a node
* full node is responsible for verifying and relaying the transactions and blocks on the network
* trustless environment
* each full node needs to download and verify every single block, and therefore every single transaction in each block
* downloading and verifying the whole chain of blocks takes time and resources

Light client:
* A light client or light node is a piece of software that connects to full nodes to interact with the blockchain
* light clients do not interact directly with the blockchain; they instead use full nodes as intermediaries
* light client protocols are designed allows them to interact with full nodes in a trust-minimized manner
* light clients only download block headers and check their proof-of-work (PoW), assuming the heaviest chain is valid
* Honest majority light-clients that trust that a majority of validators are honest

Important:
* An honest majority light client is only secure if most validators are honest.
* A full node is honest even if all validators are not honest.

---

<p class="size">Fuel’s design lets light clients say that blocks are valid through fraud proofs</p>

<div class="container">
<div class="col">
<img src="./images/client_network2.png" height=450px/>
</div>
<div class="col">
<img src="./images/client_tradeoff2.png" height=450px/>
</div>
</div>

<p class="smallersize">"trust-minimized light clients are secure under the assumption that only a single honest full node is available in the network to produce fraud proofs"<p>

Note:

Because Fuel was built for fraud proofs, the resource requirements for full nodes can be higher, thus increasing bandwidth capacity while still allowing users to verify the chain through trust-minimized light clients.

---

### Fuel's design: UTXO

<p class="size">Unspent Transaction Output model for accounting with trust-minimized light clients:</p>

<p class="smallersize">protocol for distributing data based on the amount of currency that remains after a transaction</p>

<div class="container2">
<div class="smallcol">
<img src="./images/utxo.png" height=300px/>
</div>
<div class="smallcol">
<img src="./images/utxo_graph.jpg" height=225px/>
</div>
</div>

<p class="smallersize">you can tell visually what state a transaction is touching from visually looking at the transaction<p>

---

Accounting model with honest-majority light clients:

<img src="./images/account_model.jpg" height=400px/>

<p class="smallersize">check their proof-of-work (PoW) by calculating a global state tree<p>

---

### Fuel's design: parallel execution

<div class="container">
<div class="col">
<ul class="smallersize">
    <li>EVM---you have to execute transactions sequentially</li>
    <li>UTXO---can identify transaction dependencies through what is known as state access lists</li>
    <li>Fuel---can identify the accounts that a transaction touches, mapping out dependencies before execution</li>
    <li>Fuel---can use far more threads and cores of your CPU that are typically idle in single-threaded blockchains</li>
</ul>
</div>
<div class="col">
<img src="./images/fuel_parallel.png" height=350px/>
</div>
</div>

---

<div class="container">

<div class="col">
<h3>🏛️ # 1:</h3>

<p class="size">
UTXO-based parallel transaction execution
</p>
</div>

<div class="col">
<table>
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
