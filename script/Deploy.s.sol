// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {AvaxCoins} from "../src/AvaxCoins.sol";

contract Deploy is Script {
    function setUp() public {}

    uint256 deployerPrivateKey = uint256(vm.envBytes32("DEPLOYER_PRIVATE_KEY"));

    function run() public {
        vm.startBroadcast(deployerPrivateKey);
        AvaxCoins avaxcoins = new AvaxCoins();
        vm.stopBroadcast();
    }
}
