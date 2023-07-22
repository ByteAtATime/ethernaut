# Challenge #1: Fallback

In this challenge, you have to take ownership of the `Fallback` contract.

## Hints

<details>
    <summary>Hint #1</summary>
    <p>
        Under what conditions can you become the owner? Which one is the easiest?
    </p>
</details>

<details>
    <summary>Hint #2</summary>
    <p>
        The hint is in the name, **Fallback**.
    </p>
</details>

<details>
    <summary>Hint #3</summary>
    <p>
        The special `receive()` function is called when a contract receives ether without any data.
    </p>
</details>

## Solution

<details>
    <summary>Spoiler</summary>
    <p>
        The `Fallback` contract has a `receive()` function that is called when it receives ether without any data. This function sets the `owner` to `msg.sender`, but only when the player contributes a positive amount. We can contribute a small amount, then send ether to the contract without any data to become the owner.
    </p>
</details>
