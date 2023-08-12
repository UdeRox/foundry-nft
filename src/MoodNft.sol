// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721 {
    uint256 private s_tokenCounter;
    string private s_sadSvg;
    string private s_happySvg;
    mapping(uint256 => Mood) private s_nftToMood;
    enum Mood {
        HAPPY,
        SAD
    }

    constructor(
        string memory happySvgImageUri,
        string memory sadSvgImageUri
    ) ERC721("MoodNft", "MnFT") {
        s_sadSvg = sadSvgImageUri;
        s_happySvg = happySvgImageUri;
        s_tokenCounter = 0;
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }

    function mintNft() public {
        s_nftToMood[s_tokenCounter] = Mood.HAPPY;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory tokenUri;
        // if (s_nftToMood[tokenId] == Mood.HAPPY) {
        //     tokenUri = s_happySvg;
        // } else {
        //     tokenUri = s_sadSvg;
        // }
        // return tokenUri;
        return s_happySvg;
        // return s_nftToMood[tokenId];
    }

    function getHappySvg() public view returns (string memory) {
        return s_happySvg;
    }
}
