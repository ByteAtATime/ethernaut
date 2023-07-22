# Challenge #6: Delegation

In this challenge, you have to call the `pwn()` function of a contract. However, you only have access to a contract that has a single function that calls `delegatecall()`.

## Hints

<details>
    <summary>Hint #1</summary>
    <p>
        How does `delegatecall()` work? Can you use it to call the `pwn()` function?
    </p>
</details>

<details>
    <summary>Hint #2</summary>
    <p>
        Can you `call()` the fallback function to make it `delegatecall()` with `msg.data` that has the `pwn()` function?
    </p>
</details>

<details>
    <summary>Hint #3</summary>
    <p>
        The function `abi.encodeWithSignature(string memory signature, ...) returns (bytes memory)` can be used to encode the function signature and parameters.
    </p>
</details>

## Solution

<details>
    <summary>Spoiler</summary>
    <p>
        We want the `Delegation` class to `delegatecall()` the `pwn()` function. It passes `msg.data` into `delegatecall()`, so we need to use `Delegation.call([msg.data here])` to make it `delegatecall()` the `pwn()` function. We can use `abi.encodeWithSignature("pwn()")` to get the `msg.data` that calls the `pwn()` function.
    </p>
</details>
