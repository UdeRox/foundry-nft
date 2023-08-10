// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NupNFT is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToURI;
    

    constructor() ERC721("NupNFT", "NUP") {
        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenURL) public {
        s_tokenIdToURI[s_tokenCounter] = tokenURL;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToURI[tokenId];
    }
}
