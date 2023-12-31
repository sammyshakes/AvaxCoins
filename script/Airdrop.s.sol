// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {AvaxCoins} from "../src/AvaxCoins.sol";

contract Airdrop is Script {
    AvaxCoins public avaxcoins;
    uint256 deployerPrivateKey;
    address avaxcoinsAddress;

    function setUp() public {
        deployerPrivateKey = uint256(vm.envBytes32("DEPLOYER_PRIVATE_KEY"));
        avaxcoinsAddress = vm.envAddress("DEPLOYED_CONTRACT_ADDRESS");
        avaxcoins = AvaxCoins(avaxcoinsAddress);
    }

    function run() public {
        // Prepare the airdrop data
        address[41] memory hardcodedAddresses = [
            0x388cDBc61132bf4439D342087aa0f6d23129D5bF,
            0x3a52A9aa22514aa39f80486A76c8BeDB8671f02B,
            0x3aAc2D9672Cd0e080BF5E770FeF9D2fc4E237865,
            0x3b10C8108dFeF06E626C66b9f2a3874F94202991,
            0x3b3ad18ffb699eae4bF7997c104a9b206adA9098,
            0x3B7631F8E3428dEaB77634BF799b622ce412e9Ea,
            0x3d723C7DD30BB0F8094D0aad40a8143153f166aA,
            0x3d9D5FD6114a9015b936eB144298915D5f545D5d,
            0x3e1939e4BbBDAc9737ea68EAaC1791ee9E03aA82,
            0x3E81d2Ef6711Bd52AA8e1A7721f51a68440Ec0Bb,
            0x3f6FB32d3F74268C5E65d90051E72112Cdd9c73b,
            0x3f8Ba73c86EdCc574B27bDfd06a456d39B509299,
            0x4146BF2A76d1fA4b1f0C73Ec7608ae1251E2e3FC,
            0x422fC6d98BfC720BE3B9c594a324dbdcE79C9967,
            0x42Fe9690eC459443B38d3455d494F198f4d8fB10,
            0x44062E715225067Dc501b6714f55b1C697B87BDd,
            0x4416d9BD4C1af50EA4b55f0A535030ECD73Bdf7f,
            0x44E3Daf6bfa2905ea385cc56A4324819755B8FEe,
            0x453E6E55039348016870b0992Faf01B1965d8E0f,
            0x453eD742d3D7b6DA55723d29d720b459cac9BFA4,
            0x479b5AEAf2ded3A356453446ef1cF17012A10CB7,
            0x4897903000f68e4929A152160A1F960c82C67614,
            0x48E4E74fE1d0c14404cEB57B9fec5b21329C6ec9,
            0x48F86125D2Cc5c03b32bc75527f181f00F190b7B,
            0x492e9dcd680DcFAa40226A02382Cc3B8b79F92E8,
            0x4a7f785a9250F1eE6c3449585E321e6F5191B6D9,
            0x4abd3964DCd34B37af14F1BB834495e610048D80,
            0x4aC147644db1a0c3191954ba30B6c639E5b7ebCf,
            0x4b4c2C5ab96C83110b46ec51714997709eF81B86,
            0x4b85849257539c7b58fA1f7FAc8279a8575d43A6,
            0x4BDFC8A1d2Af98692A7553a1912652e580282Bf6,
            0x4D0283566EF79Adef88883Cb96197663F20Ea5AC,
            0x4D67d7227BeFE2E6EE4E84AB130e22302006479E,
            0x4eB65a20657cA8b45eAC72d41b14E986959c5DAF,
            0x4EFB6f1ed351526Cc0A58acA0CD210dc447Ec6f3,
            0x4f55aE5521c82f09e98657EEB24450a24eA6E513,
            0x50609F2eaf1E2a0c620Ed8aD0407a70Fb665Bf9e,
            0x50b83B76dEe6607881CdE412FB627133F04dBeE4,
            0x510269cce27e897c56012FfD12d910b43708da7f,
            0x512589C3329CD446aeeAB372b7cE9Dd4fE2D1456,
            0x515e04BBeEF7D2767899BbB77be42bE54EC38C3D
        ];
        uint256[107] memory hardcodedFlatTokenIds = [
            uint256(1856),
            1858,
            1859,
            1862,
            294,
            541,
            1236,
            1135,
            1654,
            979,
            1158,
            1186,
            65,
            66,
            1011,
            1133,
            359,
            2456,
            1732,
            1796,
            32,
            33,
            396,
            397,
            398,
            399,
            400,
            401,
            432,
            433,
            1802,
            51,
            1448,
            1244,
            67,
            306,
            430,
            1132,
            1328,
            1640,
            117,
            901,
            975,
            993,
            1019,
            1102,
            1105,
            1175,
            1177,
            1286,
            1287,
            219,
            220,
            426,
            453,
            454,
            460,
            461,
            462,
            467,
            468,
            469,
            482,
            483,
            484,
            485,
            1040,
            1170,
            1171,
            425,
            761,
            25,
            230,
            62,
            63,
            528,
            1820,
            1845,
            872,
            1400,
            221,
            1281,
            284,
            351,
            1768,
            464,
            1136,
            1205,
            1283,
            1089,
            1260,
            1016,
            1072,
            1074,
            1076,
            331,
            871,
            968,
            1125,
            1305,
            1337,
            1426,
            1460,
            1510,
            1552,
            1773,
            133
        ];
        uint256[41] memory hardcodedLengths = [
            uint256(4),
            1,
            2,
            1,
            1,
            1,
            2,
            4,
            1,
            1,
            1,
            1,
            10,
            1,
            1,
            1,
            1,
            5,
            1,
            11,
            2,
            14,
            2,
            2,
            2,
            2,
            3,
            2,
            1,
            1,
            2,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            4,
            11,
            1
        ];

        // Determine dynamic sizes from hardcoded arrays
        uint256 addressesLength = hardcodedAddresses.length;
        uint256 tokenIdsLength = hardcodedFlatTokenIds.length;
        uint256 lengthsLength = hardcodedLengths.length;

        // Create dynamic arrays with determined sizes
        address[] memory recipients = new address[](addressesLength);
        uint256[] memory flatTokenIds = new uint256[](tokenIdsLength);
        uint256[] memory lengths = new uint256[](lengthsLength);

        // Populate dynamic arrays with hardcoded data
        for (uint256 i = 0; i < addressesLength; i++) {
            recipients[i] = hardcodedAddresses[i];
        }
        for (uint256 i = 0; i < tokenIdsLength; i++) {
            flatTokenIds[i] = hardcodedFlatTokenIds[i];
        }
        for (uint256 i = 0; i < lengthsLength; i++) {
            lengths[i] = hardcodedLengths[i];
        }

        // Sum of all token lengths should equal the total number of token IDs
        uint256 totalTokenCount = 0;
        for (uint256 i = 0; i < lengthsLength; i++) {
            totalTokenCount += lengths[i];
        }
        require(totalTokenCount == tokenIdsLength, "Total token count mismatch");

        // The number of addresses should match the number of lengths
        require(addressesLength == lengthsLength, "Address and lengths count mismatch");

        // Execute the airdrop
        vm.startBroadcast(deployerPrivateKey);
        avaxcoins.AirDrop(recipients, flatTokenIds, lengths);
        vm.stopBroadcast();
    }
}
