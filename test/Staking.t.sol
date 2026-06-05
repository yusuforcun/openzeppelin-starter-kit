// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Staking} from "../src/Staking.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Ödül hesaplamasını test etmek için basit bir mock token
contract MockToken is ERC20 {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}
    function mint(address to, uint256 amount) external { _mint(to, amount); }
}

contract StakingTest is Test {
    Staking staking;
    MockToken stakingToken;
    MockToken rewardToken;
    address user = address(0x1);

    function setUp() public {
        stakingToken = new MockToken("Staking", "STK");
        rewardToken = new MockToken("Reward", "RWD");
        
        staking = new Staking(address(stakingToken), address(rewardToken));
        
        stakingToken.mint(user, 1000);
        vm.prank(user);
        stakingToken.approve(address(staking), 1000);
    }

    function test_StakeUpdatesBalance() public {
        vm.prank(user);
        staking.stake(500);
        
        assertEq(staking.stakedBalance(user), 500);
    }

    function test_RewardTimeElapsed() public {
        vm.prank(user);
        staking.stake(500);

        // 1 gün ileri sar
        vm.warp(block.timestamp + 1 days);

        // Burada ödülün hesaplandığını (veya state'in değiştiğini) doğrularsın
        assertEq(staking.lastUpdatedTime(user), block.timestamp - 1 days);
    }
}