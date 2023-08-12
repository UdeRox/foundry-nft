// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;
import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {MoodNftDeploy} from "../script/MoodNftDeploy.s.sol";

contract MoodNftTest is Test {
    MoodNft public moodNft;
    string public constant MOOD_NFT_NAME = "MoodNft";
    address public add1 = makeAddr("add1");
    string public constant HAPPY_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjAwIDIwMCIgd2lkdGg9IjQwMCIgIGhlaWdodD0iNDAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgZmlsbD0ieWVsbG93IiByPSI3OCIgc3Ryb2tlPSJibGFjayIgc3Ryb2tlLXdpZHRoPSIzIi8+CiAgPGcgY2xhc3M9ImV5ZXMiPgogICAgPGNpcmNsZSBjeD0iNjEiIGN5PSI4MiIgcj0iMTIiLz4KICAgIDxjaXJjbGUgY3g9IjEyNyIgY3k9IjgyIiByPSIxMiIvPgogIDwvZz4KICA8cGF0aCBkPSJtMTM2LjgxIDExNi41M2MuNjkgMjYuMTctNjQuMTEgNDItODEuNTItLjczIiBzdHlsZT0iZmlsbDpub25lOyBzdHJva2U6IGJsYWNrOyBzdHJva2Utd2lkdGg6IDM7Ii8+Cjwvc3ZnPg==";

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

    function testHappyTokenURI() public {
        vm.prank(add1);
        moodNft.mintNft();
        assert(
            keccak256(abi.encodePacked(moodNft.tokenURI(0))) ==
                keccak256(abi.encodePacked(HAPPY_SVG_URI))
        );
    }
}
