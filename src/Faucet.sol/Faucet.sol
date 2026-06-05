// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract Faucet is Ownable, ReentrancyGuard {
    uint256 public constant AMOUNT_PER_CLAIM = 0.01 ether;
    uint256 public constant WAIT_TIME = 1 days;

    mapping(address => uint256) public nextClaimTime;

    event TokensClaimed(address indexed user, uint256 amount);

    constructor() Ownable(msg.sender) {}

    // Faucet'e para yatırma
    receive() external payable {}

    // nonReentrant burada mutfak görevlisi gibi davranır: 
    // İşlem bitmeden dışarıdan gelen saldırıları engeller.
    function claim() external nonReentrant {
        require(block.timestamp >= nextClaimTime[msg.sender], "Wait for cooldown");
        require(address(this).balance >= AMOUNT_PER_CLAIM, "Faucet empty");

        nextClaimTime[msg.sender] = block.timestamp + WAIT_TIME;

        (bool success, ) = payable(msg.sender).call{value: AMOUNT_PER_CLAIM}("");
        require(success, "Transfer failed");

        emit TokensClaimed(msg.sender, AMOUNT_PER_CLAIM);
    }

    function withdrawAll() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}