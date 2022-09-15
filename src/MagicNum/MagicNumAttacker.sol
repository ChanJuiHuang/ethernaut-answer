// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract MagicNumAttacker {
    constructor() public {
        assembly {
            mstore(0, 0x602a60005260206000f3)
            return(22, 10)
        }
    }
}