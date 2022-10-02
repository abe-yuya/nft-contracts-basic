// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

// import
import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";

// Contract
contract OffURIUnChangeable is ERC721URIStorage, Ownable {

    constructor() ERC721("OffURIUnChangeable", "OFFU") {}

    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけがmint可能 onlyOwner
     * - nefMint関数の実行アドレスにtokenIdを紐付け
     * - mintの際にURIを設定 _setTokenURI()
     */
    function nftMint(uint256 tokenId, string calldata uri) public onlyOwner
    {
        _mint(_msgSender(), tokenId);
        _setTokenURI(tokenId, uri);
    }
}