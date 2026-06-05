function test_CannotClaimTwice() public {
    vm.prank(user);
    faucet.claim();

    vm.prank(user);
    vm.expectRevert("Wait for cooldown"); // İkinci kez çağırdığında hata vermeli
    faucet.claim();
}

function test_CooldownResetsAfterTime() public {
    vm.prank(user);
    faucet.claim();

    // Zamanı 1 gün + 1 saniye ileri al (vm.warp)
    vm.warp(block.timestamp + 1 days + 1);

    vm.prank(user);
    faucet.claim(); // Artık tekrar çekebilmeli
    assertEq(address(user).balance, 0.01 ether);
}