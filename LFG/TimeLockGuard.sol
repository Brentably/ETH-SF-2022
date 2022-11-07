// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "@gnosis.pm/safe-contracts/contracts/base/GuardManager.sol";
// when they deploy the tx_guard, they will input the time that they want it locked until.
contract TimeLockGuard is Guard {

// solhint-disable-next-line payable-fallback
  fallback() external {
    // We don't revert on fallback to avoid issues in case of a Safe upgrade
    // E.g. The expected check method might change and then the Safe would be locked.
  }

    uint public time;
    uint public initTime;

    constructor(uint _time) {
        initTime = block.timestamp;
        time = _time;
    }

function checkTransaction(
        address to,
        uint256,
        bytes memory,
        Enum.Operation operation,
        uint256,
        uint256,
        uint256,
        address,
        // solhint-disable-next-line no-unused-vars
        address payable,
        bytes memory,
        address
    ) external view override {
        require(block.timestamp > initTime + time, "This call is restricted");
    }

    function checkAfterExecution(bytes32, bool) external view override {}

}
