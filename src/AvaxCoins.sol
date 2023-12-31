// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {ERC721} from "solmate/tokens/ERC721.sol";
import {Owned} from "solmate/auth/Owned.sol";
import "solmate/utils/LibString.sol";

contract AvaxCoins is ERC721, Owned {
    using LibString for uint256;

    uint256 public constant MAX_SUPPLY = 2800;
    string public baseURI = "ipfs://QmZ4WUjRAkMeFmB5oerue6ceK79g26YGrcfTvWt3NKKzJf/";

    constructor() ERC721("AvaxCoins", "AVAXCOINS") Owned(msg.sender) {}

    function AirDrop(address[] calldata to, uint256[][] calldata ids) external onlyOwner {
        require(to.length == ids.length, "MISMATCHED_ARRAY_LENGTHS");

        for (uint256 i = 0; i < to.length; i++) {
            address recipient = to[i];
            require(recipient != address(0), "INVALID_RECIPIENT");

            uint256[] memory recipientTokenIds = ids[i];

            // Counter overflow is incredibly unrealistic, so use unchecked
            unchecked {
                _balanceOf[recipient] += recipientTokenIds.length;
            }

            for (uint256 j = 0; j < recipientTokenIds.length; j++) {
                uint256 id = recipientTokenIds[j];
                require(_ownerOf[id] == address(0), "ALREADY_MINTED");

                _ownerOf[id] = recipient;

                emit Transfer(address(0), recipient, id);
            }
        }
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(tokenId < MAX_SUPPLY, "AvaxCoins: Token does not exist");

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

    function supportsInterface(bytes4 interfaceId) public view override returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
