// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract Staking is ReentrancyGuard {
    ERC20 public immutable stakingToken;
    ERC20 public immutable rewardToken;

    mapping(address => uint256) public stakedBalance;
    mapping(address => uint256) public lastUpdatedTime;

    constructor(address _stakingToken, address _rewardToken) {
        stakingToken = ERC20(_stakingToken);
        rewardToken = ERC20(_rewardToken);
    }

    function stake(uint256 amount) external nonReentrant {
        _updateReward(msg.sender);
        
        stakingToken.transferFrom(msg.sender, address(this), amount);
        stakedBalance[msg.sender] += amount;
    }

    function _updateReward(address account) internal {
        if (stakedBalance[account] > 0) {
            uint256 timeElapsed = block.timestamp - lastUpdatedTime[account];
            uint256 reward = stakedBalance[account] * timeElapsed;
         
        }
        lastUpdatedTime[account] = block.timestamp;
    }
}