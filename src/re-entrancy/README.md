# Challenge #10: Re-Entrancy

In this challenge, you will have to remove all the Ether from the `Reentrance` contract.

## Hints

<details>
    <summary>Hint #1</summary>
    <p>
        The `Reentrance` contract has a `withdraw(uint _amount)` function that can be called by anyone. It transfers Ether from the `Reentrance` contract to the caller. However, it does not update the caller's balance before transferring the Ether.
    </p>
</details>

<details>
    <summary>Hint #2</summary>
    <p>
        When a contract receives Ether, it can run code in its `receive()` fallback function.
    </p>
</details>

## Solution

<details>
    <summary>Spoiler</summary>
    <p>
        We can create a contract, with an `attack()` function that calls the `withdraw(uint _amount)` function of the `Reentrance` contract. The `attack()` function will call the `withdraw(uint _amount)` function, and then call the `withdraw(uint _amount)` function again in its `receive()` fallback function. This will cause the `Reentrance` contract to transfer Ether to the contract, and then call the `withdraw(uint _amount)` function again. This will repeat until the `Reentrance` contract runs out of Ether.
    </p>
</details>
