// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

// import
import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";

// Contract
contract OZOnlyOwnerMint is ERC721, Ownable {

    constructor() ERC721("OZOnlyOwnerMint", "OZNER") {}

    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけがmint可能 onlyOwner
     * - nefMint関数の実行アドレスにtokenIdを紐付け
     */
    function nftMint(uint256 tokenId) public onlyOwner
    {
        _mint(_msgSender(), tokenId);
    }
}