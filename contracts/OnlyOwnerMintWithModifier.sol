// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

// import
import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";

// Contract
contract OnlyOwnerMintWithModifier is ERC721 {
    /**
     * @dev
     * - このコントラクトをデプロイした人のアドレス用変数owner
     */
    address public owner;

    constructor() ERC721("OnlyOwnerMintWithModifier", "OWNERMOD") 
    {
        // コントラクトをデプロした人のイーサリアムアドレスをオーナーに指定する
        owner = _msgSender();
    }

    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけに制御するmodifier
     */
    modifier onlyOwner 
    {
        require(owner == _msgSender(), "Caller is not the owner.");
        _;
    }

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