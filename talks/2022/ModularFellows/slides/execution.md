### 🏛️ # 1: parallel transaction execution

<p class="size">Fuel is designed to be fraud-provable, which enables support for trust-minimized light clients</p>

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

<div class="container">
<div class="col">
<img src="./images/client_network2.png" height=400px/>
</div>
<div class="col">
<img src="./images/client_tradeoff2.png" height=400px/>
</div>
</div>
