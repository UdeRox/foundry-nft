// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NupNFT is ERC721 {
    uint256 private s_tokenCounter;

    constructor() ERC721("NupNFT", "NUP") {
        s_tokenCounter = 0;
    }

    function mint(address to, uint256 tokenId) public {
        _mint(to, tokenId);
    }
}
