// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenA is ERC20 {
    constructor() ERC20("TokenA", "AAA") {
        _mint(msg.sender, 10000 * 10 ** decimals());
    }
}

contract TokenB is ERC20 {
    constructor() ERC20("TokenB", "BBB") {
        _mint(msg.sender, 10000 * 10 ** decimals());
    }
}
