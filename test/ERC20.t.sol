// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {MyToken} from "../src/MyToken.sol";

contract MyTokenTest is Test {
    MyToken token;
    address owner = address(1);
    address user = address(2);

    function setUp() public {
        vm.prank(owner);
        token = new MyToken("Professional Token", "PRO");
    }

    function test_OwnerCanMint() public {
        vm.prank(owner);
        token.mint(user, 100);
        assertEq(token.balanceOf(user), 100);
    }

    function test_NonOwnerCannotMint() public {
        vm.prank(user);
        vm.expectRevert(); // Ownable hata döndürmeli
        token.mint(user, 100);
    }
}