// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {AdminPanel} from "../src/AdminPanel/AdminPanel.sol";

contract AdminPanelTest is Test {
    AdminPanel adminPanel ;
    address owner = address(1);
    address user = address(2);

    function setUp() public {
        vm.prank(owner);
        adminPanel = new AdminPanel();
    }

    function test_OnlyOwnerCanSetStatus() public {
        vm.prank(user); 
        vm.expectRevert(); 
        adminPanel.setSystemStatus(100);
    }

    function test_OwnerCanSetStatus() public {
        vm.prank(owner);
        adminPanel.setSystemStatus(100);
        assertEq(adminPanel.systemStatus(), 100);
    }

}