// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./lib/BEP20.sol";

import "../../service/ServicePayer.sol";
import "../../utils/GeneratorCopyright.sol";

/**
 * @title SimpleBEP20
 * @author BEP20 Generator (https://tokencenter.github.io/bep20-tether-usdt-generator)
 * @dev Implementation of the SimpleBEP20
 */
contract SimpleBEP20 is BEP20, ServicePayer, GeneratorCopyright("v2.0.0") {

    constructor (
        string memory name,
        string memory symbol,
        uint256 initialBalance,
        address payable feeReceiver
    )
        BEP20(name, symbol)
        ServicePayer(feeReceiver, "SimpleBEP20")
        payable
    {
        require(initialBalance > 0, "SimpleBEP20: supply cannot be zero");

        _mint(_msgSender(), initialBalance);
    }
}
