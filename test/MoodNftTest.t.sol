// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;
import {Test} from "forge-std/Test.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {MoodNftDeploy} from "../script/MoodNftDeploy.s.sol";

contract MoodNftTest is Test {
    MoodNft public moodNft;
    string public constant MOOD_NFT_NAME = "MoodNft";

    function setUp() public {
        MoodNftDeploy deploy = new MoodNftDeploy();
        moodNft = deploy.run();
        // moodNft = deploy.moodNft();
    }

    function testDeployedNFTName() public view {
        assert(
            keccak256(abi.encodePacked(MOOD_NFT_NAME)) ==
                keccak256(abi.encodePacked(moodNft.name()))
        );
    }

    function testInitialTokenCount() public {
        assertEq(0, moodNft.getTokenCounter());
    }

    function testHappySvgURL() public {}
}
