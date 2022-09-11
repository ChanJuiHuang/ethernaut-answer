// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./DoubleEntryPoint.sol";

contract DetectionBot is IDetectionBot {
    Forta public forta;
    CryptoVault public cryptoVault;

    constructor (Forta _forta, CryptoVault _cryptoVault) public {
        forta = _forta;
        cryptoVault = _cryptoVault;
    }

    function handleTransaction(address user, bytes calldata msgData) external override {
        address to = bytesToAddress(bytes(msgData[4:36]));

        if (to == cryptoVault.sweptTokensRecipient()) {
            forta.raiseAlert(user);
        }
    }

    function bytesToAddress(bytes memory _to) private pure returns(address) {
        bytes20 to;

        for (uint256 i = 12; i < 32; i++) {
            bytes20 temp = _to[i];
            temp = temp >> (8 * (i - 12));
            to = to | temp;
        }

        return address(to);
    }
}
