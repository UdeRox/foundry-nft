// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {NupNFT} from "../src/NupNFT.sol";

contract MintContract is Script {
    string public constant NFT_URL =
        "https://bafybeigcnzlecuumq3c4yglioxjdnxyxvo52vv6sd33sqdffuv4ppbzqfi.ipfs.dweb.link/image.png";

    function run() external {
        address contractAddress = DevOpsTools.get_most_recent_deployment(
            "NupNFT",
            block.chainid
        );
        mintNftOnContract(contractAddress);
    }

    function mintNftOnContract(address nftAddress) public {
        vm.startBroadcast();
        NupNFT(nftAddress).mintNft(NFT_URL);
        vm.stopBroadcast();
    }
}
