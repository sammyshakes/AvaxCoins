// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {AvaxCoins} from "../src/AvaxCoins.sol";

contract Airdrop is Script {
    function setUp() public {}

    uint256 deployerPrivateKey = uint256(vm.envBytes32("DEPLOYER_PRIVATE_KEY"));
    AvaxCoins public avaxcoins;

    address avaxcoinsAddress = vm.envAddress("DEPLOYED_CONTRACT_ADDRESS");

    address sampleUser = vm.envAddress("DEPLOYER_ADDRESS");

    function run() public {
        avaxcoins = AvaxCoins(avaxcoinsAddress);

        // Prepare the airdrop data
        address[] memory recipients = new address[](1); // Number of recipients
        uint256[][] memory tokenIds = new uint256[][](1); // Corresponding token IDs for each recipient

        // Define recipients and their token IDs
        recipients[0] = address(sampleUser); // Replace with actual recipient address
        tokenIds[0] = new uint256[](1); // Number of tokens for the first recipient
        tokenIds[0][0] = 1; // First token ID for the first recipient

        // Execute the airdrop
        vm.startBroadcast(deployerPrivateKey);
        avaxcoins.AirDrop(recipients, tokenIds);
        vm.stopBroadcast();
    }
}
