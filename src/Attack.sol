// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

abstract contract Attack is Test {
  address internal owner;
  address internal attacker;

  constructor() {
    owner = makeAddr("owner");
    attacker = makeAddr("attacker");

    deal(owner, 1000 ether);
    deal(attacker, 1000 ether);
  }

  function assertFinished(address _instance) internal {
    assertEq(validateInstance(payable(_instance), attacker), true);
  }

  function validateInstance(address payable _instance, address _player) virtual public returns (bool);
}
