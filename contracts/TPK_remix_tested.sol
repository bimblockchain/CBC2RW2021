//Contract based on https://docs.openzeppelin.com/contracts/3.x/erc721
// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;


//for remix use the 3.4 version of the contrancts
//first instance of this contract on Ropsten: 0x41b101e30124ff0f6ee8c091e00178d87eb3b4c5
//on ropsten here: https://ropsten.etherscan.io/address/0x41b101e30124ff0f6ee8c091e00178d87eb3b4c5
//on Ropsten here: "0xCb32C5E0D5ea5dEc1d6D5B2624eEEc35b8cf302c", Owned by ArchchainONE

//test with the python script from Dynamo, Blender, Grasshopper with python3. Have at least on of them working.
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/access/Ownable.sol";


contract TopoToken is ERC721, Ownable {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() public ERC721("TopoToken", "TPK") {}

    function mintNFT(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
