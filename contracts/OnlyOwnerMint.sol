// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

// import
import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";

// Contract
contract OnlyOwnerMint is ERC721 {
    /**
     * @dev
     * - このコントラクトをデプロイした人のアドレス用変数owner
     */
    address public owner;

    constructor() ERC721("OnlyOwnerMint", "OWNER") {
        // // コントラクトをデプロした人のイーサリアムアドレスをオーナーに指定する
        owner = _msgSender();
    }

    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけがmint可能
     * - nefMint関数の実行アドレスにtokenIdを紐付け
     */
    function nftMint(uint256 tokenId) public {
        require(owner == _msgSender(), "Caller is not the owner.");
        _mint(_msgSender(), tokenId);
    }
}