# Challenge #5: Token

*NOTE: I had to modify the `Token` contract to make it work with Solidity 0.8.21. I had trouble with 0.6.12, if anyone would like to help feel free to contact me.*

In this challenge, you have been given 20 tokens, and you need to get more than that.

## Hints

<details>
    <summary>Hint #1</summary>
    <p>
        The `transfer()` function checks if `balances[msg.sender] - _value >= 0`. What happens if `balances[msg.sender] - _value` is negative?
    </p>
</details>

## Solution

<details>
    <summary>Spoiler</summary>
    <p>
        We can make `balances[msg.sender] - _value` negative by setting `_value` greater than 20 (the amount of tokens the player has). Then, we can transfer a very large number of tokens to another account. This will cause `balances[msg.sender] - _value` to be negative, and the number will underflow (becoming `type(uint256).max - _value + 20`). This number is greater than 20 (`type(uint256).max` is 2**256 - 1), so you end up with more tokens than you started with.
    </p>
</details>
