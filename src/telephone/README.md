# Challenge #4: Telephone

In this challenge, you have to take ownership of the `Telephone` contract.

## Hints

<details>
    <summary>Hint #1</summary>
    <p>
        The `Telephone` contract has a `changeOwner(address _owner)` function that can be called by anyone. However, it only sets the `owner` to `msg.sender` if `msg.sender != tx.origin`. What do each of these variables represent?
    </p>
</details>

<details>
    <summary>Hint #2</summary>
    <p>
        The `msg.sender` variable represents the address of the account that called the function. The `tx.origin` variable represents the address of the account that created the transaction. What happens if we call the `changeOwner(address _owner)` function from a contract?
    </p>
</details>

## Solution

<details>
    <summary>Spoiler</summary>
    <p>
        We can create a contract that calls the `changeOwner(address _owner)` function. The `msg.sender` variable will be the address of the contract, and the `tx.origin` variable will be the address of the player. These are different addresses, therefore causing the `owner` to be set to the player's address.
    </p>
</details>
