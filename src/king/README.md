# Challenge #9: King

In this challenge, you have to prevent other players from becoming the king of the hill.

## Hints

<details>
    <summary>Hint #1</summary>
    <p>
        The `King` contract sends Ether to the previous king when a new king is crowned.
    </p>
</details>

<details>
    <summary>Hint #2</summary>
    <p>
        The `King` contract uses `transfer()` to send Ether to the previous king. What happens if the previous king is a contract that has a fallback function that is not `payable`?
    </p>
</details>

## Solution

<details>
    <summary>Spoiler</summary>
    <p>
        We can create a contract that has a fallback function that does not have a `payable` fallback function. Then, we can become the king and send Ether to the contract. The `King` contract will try to send Ether to the contract, but the fallback function will revert and the transaction will fail. This will prevent other players from becoming the king.
    </p>
</details>
