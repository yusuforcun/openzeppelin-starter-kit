// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {MyNFT} from "../src/MyNFT.sol";

contract MyNFTTest is Test {
    MyNFT nft;
    address user = address(0x1);
    address receiver = address(0x2);

    function setUp() public {
        nft = new MyNFT();
    }

    function test_MintAndOwn() public {
        nft.safeMint(user);
        assertEq(nft.ownerOf(0), user);
    }

    function test_ApprovalSystem() public {
        nft.safeMint(user);
        
        vm.prank(user);
        nft.approve(receiver, 0); // Receiver'a 0 numaralı NFT için onay ver
        
        vm.prank(receiver);
        nft.transferFrom(user, receiver, 0); // Onaylı kişi transferi yapabilir
        
        assertEq(nft.ownerOf(0), receiver);
    }
}