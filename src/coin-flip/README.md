# Challenge #3: Coin Flip

In this challenge, you have to guess the outcome of a coin flip 10 consecutive times. This outcome is calculated from `block.timestamp`.

## Hints

<details>
    <summary>Hint #1</summary>
    <p>
        Can you find a way to flip the coin when you know the `block.timestamp`?
    </p>
</details>

<details>
    <summary>Hint #2</summary>
    <p>
        When a contract calls another contract, both are executed in the same block.
    </p>
</details>

## Solution

<details>
    <summary>Spoiler</summary>
    <p>
        To be able to predict the outcome of the coin flip, we have to somehow know the `block.timestamp` before the coin flip is executed. This can be done by calling a contract that calls the coin flip contract. When a contract calls another contract, both are executed in the same block. This means that the `block.timestamp` is the same for both contracts. We can then use the `block.timestamp` to calculate the outcome of the coin flip.
    </p>
</details>
