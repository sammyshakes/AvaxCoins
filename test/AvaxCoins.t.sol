// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {AvaxCoins} from "../src/AvaxCoins.sol";

contract AvaxCoinsTest is Test {
    AvaxCoins public avaxcoins;

    // test users
    address testUser1 = vm.addr(1); // Test user 1
    address testUser2 = vm.addr(2); // Test user 2
    address testUser3 = vm.addr(3); // Test user 3

    function setUp() public {
        avaxcoins = new AvaxCoins();
    }

    function testBaseURI() public {
        avaxcoins.setBaseURI("ipfs://QmNu7jdn6f1uuGQD7J4M85rSEBqky7Bae1a2toZP3Sna8x/");
        assertEq(avaxcoins.baseURI(), "ipfs://QmNu7jdn6f1uuGQD7J4M85rSEBqky7Bae1a2toZP3Sna8x/");
    }

    function testAirDrop() public {
        address[] memory to = new address[](1);
        uint256[][] memory ids = new uint256[][](1);
        to[0] = address(this);
        ids[0] = new uint256[](1);
        ids[0][0] = 1;
        avaxcoins.AirDrop(to, ids);
        assertEq(avaxcoins.balanceOf(address(this)), 1);
    }

    function testComplexAirDrop() public {
        // Define multiple recipient addresses
        address[] memory recipients = new address[](3);
        recipients[0] = testUser1;
        recipients[1] = testUser2;
        recipients[2] = testUser3;

        // Define token IDs for each recipient
        uint256[][] memory tokenIds = new uint256[][](3);
        tokenIds[0] = new uint256[](2); // Two tokens for the first address
        tokenIds[0][0] = 10; // Example token ID
        tokenIds[0][1] = 11; // Example token ID

        tokenIds[1] = new uint256[](1); // One token for the second address
        tokenIds[1][0] = 20; // Example token ID

        tokenIds[2] = new uint256[](3); // Three tokens for the third address
        tokenIds[2][0] = 30; // Example token ID
        tokenIds[2][1] = 31; // Example token ID
        tokenIds[2][2] = 32; // Example token ID

        // Execute the AirDrop function
        avaxcoins.AirDrop(recipients, tokenIds);

        // Assert the balance of each address and the ownership of each token
        assertEq(avaxcoins.balanceOf(recipients[0]), 2);
        assertEq(avaxcoins.ownerOf(10), recipients[0]);
        assertEq(avaxcoins.ownerOf(11), recipients[0]);

        assertEq(avaxcoins.balanceOf(recipients[1]), 1);
        assertEq(avaxcoins.ownerOf(20), recipients[1]);

        assertEq(avaxcoins.balanceOf(recipients[2]), 3);
        assertEq(avaxcoins.ownerOf(30), recipients[2]);
        assertEq(avaxcoins.ownerOf(31), recipients[2]);
        assertEq(avaxcoins.ownerOf(32), recipients[2]);
    }

    function testTransferFrom() public {
        // AirDrop tokens to testUser1
        address[] memory recipients = new address[](1);
        uint256[][] memory tokenIds = new uint256[][](1);

        recipients[0] = testUser1; // Address of testUser1
        tokenIds[0] = new uint256[](1);
        tokenIds[0][0] = 200; // Example token ID

        avaxcoins.AirDrop(recipients, tokenIds);

        // Assert the balance of testUser1
        assertEq(avaxcoins.balanceOf(testUser1), 1);

        // Transfer the token from testUser1 to testUser2
        vm.prank(testUser1);
        avaxcoins.transferFrom(testUser1, testUser2, 200);

        // Assert the balance of testUser1 and testUser2
        assertEq(avaxcoins.balanceOf(testUser1), 0);
        assertEq(avaxcoins.balanceOf(testUser2), 1);

        // Assert the ownership of the token
        assertEq(avaxcoins.ownerOf(200), testUser2);

        // have testuser2 use safetranferfrom to send the token back to testuser1
        vm.prank(testUser2);
        avaxcoins.safeTransferFrom(testUser2, testUser1, 200);

        // Assert the balance of testUser1 and testUser2
        assertEq(avaxcoins.balanceOf(testUser1), 1);
        assertEq(avaxcoins.balanceOf(testUser2), 0);

        // Assert the ownership of the token
        assertEq(avaxcoins.ownerOf(200), testUser1);
    }
}
