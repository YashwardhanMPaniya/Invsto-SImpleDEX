// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IERC20.sol";

contract SimpleDEX {
    // State variables
    address public owner;
    IERC20 public tokenA;
    IERC20 public tokenB;
    uint public exchangeRate;

    // Events
    event ExchangeRateUpdated(uint newRate);
    event ExchangedTokenAForTokenB(address user, uint amountA, uint amountB);
    event ExchangedTokenBForTokenA(address user, uint amountB, uint amountA);

    // Modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    // Constructor
    constructor(address _tokenA, address _tokenB, uint _exchangeRate) {
        owner = msg.sender;
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
        exchangeRate = _exchangeRate;
    }

    function setExchangeRate(uint _newRate) external onlyOwner {
        exchangeRate = _newRate;
        emit ExchangeRateUpdated(_newRate);
    }

    function exchangeTokenAForTokenB(uint amountA) external {
        uint amountB = (amountA * exchangeRate) / 1 ether;
        require(tokenB.balanceOf(address(this)) >= amountB, "Not enough tokenB liquidity.");
        require(tokenA.transferFrom(msg.sender, address(this), amountA), "TokenA transfer failed.");
        require(tokenB.transfer(msg.sender, amountB), "TokenB transfer failed.");
        emit ExchangedTokenAForTokenB(msg.sender, amountA, amountB);
    }

    function exchangeTokenBForTokenA(uint amountB) external {
        uint amountA = (amountB * 1 ether) / exchangeRate;
        require(tokenA.balanceOf(address(this)) >= amountA, "Not enough tokenA liquidity.");
        require(tokenB.transferFrom(msg.sender, address(this), amountB), "TokenB transfer failed.");
        require(tokenA.transfer(msg.sender, amountA), "TokenA transfer failed.");
        emit ExchangedTokenBForTokenA(msg.sender, amountB, amountA);
    }
}
