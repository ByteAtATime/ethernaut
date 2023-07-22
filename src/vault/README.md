# Challenge #8: Vault

In this challenge, you have to get the password to the vault.

## Hints

<details>
    <summary>Hint #1</summary>
    <p>
        The `Vault` contract has a `password` field that is set in the constructor. It is marked as `private`, but what does that mean?
    </p>
</details>

<details>
    <summary>Hint #2</summary>
    <p>
        The `private` modifier means that the `password` field can only be accessed by the `Vault` contract. However, Ethereum nodes still have to store the `password` field in the blockchain.
    </p>
</details>

## Solution

<details>
    <summary>Spoiler</summary>
    <p>
        We can use our framework to inspect the storage of the `Vault` contract. We can see that the `password` field is stored at index 1. In Web3.JS, we can use the `getStorageAt()` function to get the value of the `password` field. In Foundry, we use `vm.load(address, slot)`.
    </p>
</details>
