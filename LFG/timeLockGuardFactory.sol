// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "@gnosis.pm/safe-contracts/contracts/base/GuardManager.sol";
import "./TimeLockGuard.sol";
// when they deploy the tx_guard, they will input the time that they want it locked until.


contract TimeLockGuardFactory {
  TimeLockGuard[] public timeLockGuards;


  function create(uint _time) public {
        TimeLockGuard timeLockGuard = new TimeLockGuard(_time);
        timeLockGuards.push(timeLockGuard);
    }

}
