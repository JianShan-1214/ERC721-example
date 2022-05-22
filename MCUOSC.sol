// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/utils/Counters.sol";

contract MCUOSC is ERC721, Ownable {
    using Counters for Counters.Counter;
    using Strings for uint256;

    Counters.Counter private _tokenIdCounter;
    
    bool public _revealed = false;
    uint256 public constant MAX_SUPPLY = 7;
    uint256 public mintPrice = 0.05 ether;
    uint256 totalSupply = 0;



    constructor() ERC721("MCUOSC", "MO") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://gateway.pinata.cloud/ipfs/QmcJPSNLR7drk9WXsK8PZfBCT7YyqruiZo4MK96Rz1TsW2/";
    }

    function mint() public payable {
        require(
            totalSupply + 1 < MAX_SUPPLY,
            "Sale done"
        );
        require(
            mintPrice <= msg.value,
            "Not enough ether"
        );
        _mint();
    }

    function _mint() internal {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
    }

    function tokenURI(uint256 tokenId)public view override returns(string memory){
        require(
            _exists(tokenId),
            "URI query for nonexistent token"
        );
        if(_revealed == false){
            return "https://gateway.pinata.cloud/ipfs/QmR5YGsQfFcuaxX7QHbYvtDTV7R8e4wPzYNPYjUFb5cpFy";
        }
        return string(abi.encodePacked(_baseURI(), tokenId.toString(), ".json"));
    }

    function flipReveal() public onlyOwner{
        _revealed = !_revealed;
    }
    
}
