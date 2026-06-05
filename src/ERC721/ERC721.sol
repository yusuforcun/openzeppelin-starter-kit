// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract DeepDiveNFT is ERC721 {
    uint256 private _nextTokenId;

    constructor() ERC721("DeepNFT", "DNFT") {}

   function _update(address to, uint256 tokenId, address auth) internal override returns (address) {
        address from = super._update(to, tokenId, auth);
        
        return from;
    }

    function safeMint(address to) external {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }
}