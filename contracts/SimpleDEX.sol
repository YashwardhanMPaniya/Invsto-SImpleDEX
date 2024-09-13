// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IERC20.sol";

contract SimpleDEX {
    // State variables
    address public owner;
    IERC20 public tokenA;
    IERC20 public tokenB;
    uint public exchangeRate; // exchange rate from tokenA to tokenB (fixed rate)

    // Events
    event ExchangeRateUpdated(uint newRate);
    event ExchangedTokenAForTokenB(address user, uint amountA, uint amountB);
    event ExchangedTokenBForTokenA(address user, uint amountB, uint amountA);

    // Modifier to ensure only owner can perform certain actions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    // Constructor to initialize the contract with tokens and exchange rate
    constructor(address _tokenA, address _tokenB, uint _exchangeRate) {
        owner = msg.sender;
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
        exchangeRate = _exchangeRate;
    }

    // Function to update the exchange rate (only owner)
    function setExchangeRate(uint _newRate) external onlyOwner {
        exchangeRate = _newRate;
        emit ExchangeRateUpdated(_newRate);
    }

    // Exchange tokenA for tokenB
    function exchangeTokenAForTokenB(uint amountA) external {
        // Calculate the amount of tokenB the user will receive
        uint amountB = (amountA * exchangeRate) / 1 ether;

        // Ensure the DEX has enough tokenB to cover the exchange
        require(tokenB.balanceOf(address(this)) >= amountB, "Not enough tokenB liquidity.");

        // Transfer tokenA from user to DEX
        require(tokenA.transferFrom(msg.sender, address(this), amountA), "TokenA transfer failed.");

        // Transfer tokenB from DEX to user
        require(tokenB.transfer(msg.sender, amountB), "TokenB transfer failed.");

        emit ExchangedTokenAForTokenB(msg.sender, amountA, amountB);
    }

    // Exchange tokenB for tokenA
    function exchangeTokenBForTokenA(uint amountB) external {
        // Calculate the amount of tokenA the user will receive
        uint amountA = (amountB * 1 ether) / exchangeRate;

        // Ensure the DEX has enough tokenA to cover the exchange
        require(tokenA.balanceOf(address(this)) >= amountA, "Not enough tokenA liquidity.");

        // Transfer tokenB from user to DEX
        require(tokenB.transferFrom(msg.sender, address(this), amountB), "TokenB transfer failed.");

        // Transfer tokenA from DEX to user
        require(tokenA.transfer(msg.sender, amountA), "TokenA transfer failed.");

        emit ExchangedTokenBForTokenA(msg.sender, amountB, amountA);
    }
}
