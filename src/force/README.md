# Challenge #7: Force

In this challenge, you have to force Ether into the `Force` contract.

## Hints

<details>
    <summary>Hint #1</summary>
    <p>
        Take a look at the documentation for the `selfdestruct(address payable recipient)` function.
    </p>
</details>

<details>
    <summary>Hint #2</summary>
    <p>
        The `selfdestruct(address payable recipient)` function sends all the Ether in the contract to the `recipient` address, ignoring any fallback functions (and whether they're `payable`).
    </p>
</details>

## Solution

<details>
    <summary>Spoiler</summary>
    <p>
        We can create a dummy contract that accepts Ether, then call `selfdestruct()` on it to send the Ether to the `Force` contract.
    </p>
</details>
