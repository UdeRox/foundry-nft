// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NupNFT is ERC721 {
    uint256 private s_tokenCounter;

    constructor() ERC721("NupNFT", "NUP") {
        s_tokenCounter = 0;
    }

    function mintToken(string memory /*tokenURI*/) public{
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    } 

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }

    // function getName() public view returns (string memory){
    //     return 
    // }
    function incrementTokenCounter() public {
        s_tokenCounter++;
    }
}
