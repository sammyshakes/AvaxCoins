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
        address[42] memory hardcodedAddresses = [
            0xE33736e7357F9EDC248baeC97D66D90e8C9a8eBC,
            0xe36b2326155A6A2f89b9a0d9a2160b100B76074E,
            0xE41A11a4cB8a5a57D3BEE3719C391435af29b978,
            0xE49Debc1531dCa0588CEe8c1c19F5159317F46EB,
            0xE4DbA553b45509d02dA2137e866C04343F5b0ca8,
            0xe5652bbe7Bf93fAcA205665130Bfc5332205dEDa,
            0xe5B1d82D7Ce916a33996B1FB55aC277845A1a32B,
            0xe60c414db4689f395735c6FF4eeca2F3614C583b,
            0xe6Da1a1cFd5Ea17E3D665F207D0C1037fd846b28,
            0xE76313C3BF4F36CcAfD545Ec851b77d525Ca0B90,
            0xEaC1B782a824AcA2E81f2C4F3598555e5D32C140,
            0xebd46cf8c54c08B2EC1Ac0C538fd4740Fa7e4e83,
            0xEc5C65275e61840C7403408cDa4692A1D878df9C,
            0xEc5cf90bE8f08bB9211E61D71a6Ed114D719E452,
            0xEC93B49F2093c88Dc9F72e599dFfCf3A9295bE22,
            0xEcFca03a9326541F69FF0210FB0CAfAdde935DE9,
            0xeD519f53EB2F9FE1612dAEc16De4F4133e19d2AF,
            0xEf5C63CDDA93631C6734CE335c65FAc05b9397Ba,
            0xF123E47F0c4644aD7e7827672D1f5C7C75A1B109,
            0xf1Ca9441E8BbdE4dd3207A8Ef5C4581CF7A8813f,
            0xF2491F21716741c16De7EE67C1224DEC342dca50,
            0xF25a3f868aC8ffb7DC9d10efa7384F7bC8b8c1d2,
            0xF347c2146C609D5F22CecC16B6ffF0813d2C5126,
            0xf3C311d0F9Ba32B4Ca56044ec3905E70059AaF84,
            0xF5f08Ba7F46e2a86b5ef3BFD56c2097C9f4276D7,
            0xf642B110a163378009041E937d1643e40b3B07dc,
            0xf6FDC7947187A470dd2A0a17Ea6D3d32907d68C6,
            0xf7a7ae64Cf9E9dd26Fd2530a9B6fC571A31e75A1,
            0xF88362D81A1D0eBc40C50E92340Af129a268563b,
            0xF90A01Af91468F5418cDA5Ed6b19C51550eB5352,
            0xF9BBB08373Ef7367987985bdd8dfb8B4a6569029,
            0xFa14c77D5507c957D807C893d8d507D2Ca7bD798,
            0xFA7F35915D1F34b091A04F38E3A2185f7f3901a9,
            0xfAe15BfF8B52072eDa4E1FF7a7641E969C5c4afa,
            0xfB7cB5cD77bF356c7EC27513bAe31B38CA798b1a,
            0xfb8eC93129b6fa7c87E2c60F5Cd9e08b1D778Fc9,
            0xfd15C620E1FbF9a886A79Bd897ED579b294B27a9,
            0xfd68c7BC304A2D5d73a33487D0F50891aDbFD2C5,
            0xFE179834E0BAda78959801f2F82c2ea5B8300727,
            0xFF6d6da20E7e263823806B033C8c7A5dD4194559,
            0xff73755c1faAfe51943a170553531142CaB939DE,
            0xfFcbe5A6D807D47deea491cFc9A606fDEdfD8eA3
        ];
        uint256[336] memory hardcodedFlatTokenIds = [
            uint256(29),
            69,
            369,
            393,
            1048,
            1121,
            1122,
            1145,
            1211,
            1261,
            1262,
            1263,
            1264,
            1265,
            1406,
            131,
            307,
            31,
            148,
            149,
            150,
            152,
            440,
            441,
            442,
            443,
            444,
            445,
            1107,
            247,
            248,
            332,
            333,
            362,
            1179,
            122,
            288,
            546,
            298,
            360,
            1147,
            228,
            43,
            76,
            154,
            159,
            367,
            458,
            989,
            1022,
            1043,
            1103,
            1111,
            1151,
            1153,
            1184,
            1200,
            1204,
            1223,
            1241,
            1288,
            1311,
            1346,
            1347,
            1348,
            1349,
            1350,
            1351,
            1352,
            1353,
            1354,
            1355,
            1370,
            1372,
            1373,
            1374,
            1375,
            1376,
            1379,
            1380,
            1385,
            1386,
            1387,
            1388,
            1391,
            1396,
            1397,
            1402,
            1403,
            1404,
            1410,
            1411,
            1423,
            1424,
            1425,
            1436,
            1437,
            1438,
            1439,
            1478,
            1479,
            1540,
            1541,
            1724,
            1549,
            1550,
            142,
            143,
            144,
            145,
            146,
            147,
            1596,
            164,
            231,
            232,
            233,
            234,
            235,
            321,
            327,
            352,
            353,
            354,
            355,
            356,
            419,
            473,
            474,
            475,
            476,
            477,
            522,
            523,
            524,
            525,
            526,
            547,
            549,
            916,
            965,
            990,
            1234,
            1268,
            1389,
            1390,
            1398,
            1401,
            1434,
            1477,
            1511,
            1784,
            185,
            951,
            955,
            2658,
            2683,
            2685,
            2698,
            2700,
            2705,
            49,
            129,
            161,
            211,
            213,
            240,
            242,
            340,
            405,
            439,
            529,
            783,
            981,
            1014,
            1018,
            1020,
            1117,
            1193,
            1198,
            1382,
            1407,
            1412,
            1450,
            1462,
            1464,
            1465,
            1491,
            1495,
            1501,
            1502,
            1513,
            1514,
            1526,
            1533,
            1554,
            1676,
            1677,
            1719,
            1755,
            1772,
            1778,
            1813,
            1819,
            1848,
            1849,
            1850,
            2543,
            2563,
            2564,
            2565,
            2567,
            2568,
            2570,
            2571,
            2573,
            2575,
            2576,
            2577,
            2578,
            2579,
            2581,
            2582,
            2593,
            2601,
            2603,
            2606,
            2611,
            2612,
            2613,
            2614,
            2617,
            2619,
            2621,
            2624,
            2625,
            2626,
            2627,
            2628,
            2629,
            2633,
            2634,
            2635,
            2637,
            2638,
            2639,
            2641,
            2642,
            2644,
            2646,
            2647,
            2648,
            2650,
            2651,
            2654,
            2655,
            495,
            1635,
            1822,
            1096,
            1130,
            30,
            210,
            293,
            973,
            998,
            999,
            1000,
            1001,
            1002,
            1196,
            1202,
            1275,
            1795,
            1169,
            2528,
            2529,
            2530,
            2531,
            2532,
            2533,
            2534,
            2535,
            2536,
            2537,
            1098,
            1832,
            225,
            326,
            314,
            1315,
            1165,
            1166,
            1167,
            1168,
            1015,
            1818,
            1855,
            1088,
            899,
            1057,
            48,
            2475,
            2476,
            2477,
            2478,
            2479,
            1716,
            2659,
            2661,
            2663,
            2664,
            2665,
            2684,
            2686,
            2687,
            2689,
            2691,
            2692,
            2693,
            2695,
            2696,
            2697,
            2699,
            2703,
            1457,
            1469,
            1470,
            1717,
            1718,
            1726,
            1727,
            404,
            1336,
            2191,
            2484
        ];
        uint256[42] memory hardcodedLengths = [
            uint256(15),
            2,
            12,
            5,
            1,
            3,
            2,
            1,
            1,
            62,
            2,
            6,
            1,
            38,
            1,
            1,
            2,
            6,
            95,
            3,
            1,
            1,
            13,
            1,
            10,
            1,
            1,
            2,
            1,
            1,
            4,
            3,
            1,
            1,
            1,
            1,
            5,
            18,
            1,
            6,
            1,
            3
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
