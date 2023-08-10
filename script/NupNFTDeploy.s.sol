// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import {NupNFT} from "../src/NupNFT.sol";

contract NupNFTDeploy is Script {
    NupNFT nupNft;

    function run() external returns (NupNFT) {
        vm.startBroadcast();
        nupNft = new NupNFT();
        vm.stopBroadcast();
        return nupNft;
    }
}
