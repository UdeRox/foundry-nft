// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Test, console} from "forge-std/Test.sol";
import {NupNFTDeploy} from "../script/NupNFTDeploy.s.sol";
import {NupNFT} from "../src/NupNFT.sol";

contract NupNFTTest is Test {
    NupNFTDeploy nupNftDeploy;
    NupNFT nupNft;
    address deployAddress = makeAddr("deployer");

    function setUp() public {
        nupNftDeploy = new NupNFTDeploy();
        nupNft = nupNftDeploy.run();
    }

    function testNftNameIsCorrect() public view {
        string memory nftName = "NupNFT";
        string memory contractName = nupNft.name();
        assert(
            keccak256(abi.encodePacked(nftName)) ==
                keccak256(abi.encodePacked(contractName))
        );
    }
}
