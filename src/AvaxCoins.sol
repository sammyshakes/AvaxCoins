// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {ERC721} from "solmate/tokens/ERC721.sol";
import {Owned} from "solmate/auth/Owned.sol";
import "solmate/utils/LibString.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";

/*
     _                   ____      _           _   _ _____ _____
    / \__   ____ ___  __/ ___|___ (_)_ __  ___| \ | |  ___|_   _|
   / _ \ \ / / _` \ \/ / |   / _ \| | '_ \/ __|  \| | |_    | |
  / ___ \ V / (_| |>  <| |__| (_) | | | | \__ \ |\  |  _|   | |
 /_/   \_\_/ \__,_/_/\_\\____\___/|_|_| |_|___/_| \_|_|     |_|
*/

contract AvaxCoins is ERC721, Owned, ERC2981 {
    using LibString for uint256;

    uint256 public constant MAX_SUPPLY = 2800;
    uint96 public royaltyFeeNumerator = 500; // 5% royalty
    address public royaltyAddress = 0x0e4fcEC26c9f85c3D714370c98f43C4E02Fc35Ae;
    string public baseURI = "ipfs://QmZ4WUjRAkMeFmB5oerue6ceK79g26YGrcfTvWt3NKKzJf/";

    constructor() ERC721("AvaxCoins", "AVAXCOINS") Owned(msg.sender) {
        _setDefaultRoyalty(royaltyAddress, royaltyFeeNumerator);
    }

    function AirDrop(address[] calldata to, uint256[] calldata flatTokenIds, uint256[] calldata lengths)
        external
        onlyOwner
    {
        require(to.length == lengths.length, "MISMATCHED_ARRAY_LENGTHS");

        uint256 tokenIdIndex = 0;

        for (uint256 i = 0; i < to.length; i++) {
            address recipient = to[i];
            require(recipient != address(0), "INVALID_RECIPIENT");

            uint256 numberOfTokens = lengths[i];

            // Counter overflow is incredibly unrealistic, so use unchecked
            unchecked {
                _balanceOf[recipient] += numberOfTokens;
            }

            for (uint256 j = 0; j < numberOfTokens; j++) {
                require(tokenIdIndex < flatTokenIds.length, "TOKEN_ID_INDEX_OUT_OF_BOUNDS");

                uint256 id = flatTokenIds[tokenIdIndex++];
                require(_ownerOf[id] == address(0), "ALREADY_MINTED");

                _ownerOf[id] = recipient;

                emit Transfer(address(0), recipient, id);
            }
        }
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(tokenId <= MAX_SUPPLY, "AvaxCoins: Token does not exist");

        string memory baseUri = _baseURI();
        return bytes(baseUri).length > 0 ? string(abi.encodePacked(baseUri, tokenId.toString())) : "";
    }

    function _baseURI() internal view returns (string memory) {
        return baseURI;
    }

    function setBaseURI(string memory _uri) external onlyOwner {
        baseURI = _uri;
    }

    function withdraw() external onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "AvaxCoins: Nothing to withdraw");

        require(payable(msg.sender).send(address(this).balance));
    }

    function setTokenRoyalties(uint96 _royalties) external onlyOwner {
        royaltyFeeNumerator = _royalties;
        _setDefaultRoyalty(royaltyAddress, royaltyFeeNumerator);
    }

    function setRoyaltyPayoutAddress(address _payoutAddress) external onlyOwner {
        royaltyAddress = _payoutAddress;
        _setDefaultRoyalty(royaltyAddress, royaltyFeeNumerator);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC2981) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
