// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

// import
import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";

// Contract
contract EventNFT is ERC721URIStorage, Ownable {
    /**
     * @dev
     * - URI設定時に誰がどのtokenIdに何のURIを設定したかログを出力する
     * - MEMO: パラメーターにindexedを付与すると、フロントとかイーサスキャンとかでログを確認する時に、パラメーターの名前ではなく、値で絞り込みができるようになる。
     */
    event TokenURIChanged(
        address indexed sender, 
        uint256 indexed tokenId, 
        string uri
    );

    constructor() ERC721("EventNFT", "EVENT") {}

    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけがmint可能 onlyOwner
     * - nefMint関数の実行アドレスにtokenIdを紐付け
     * - mintの際にURIを設定 _setTokenURI()
     * - EVENT発火 emit TokenURIChanged
     */
    function nftMint(uint256 tokenId, string calldata uri) public onlyOwner
    {
        _mint(_msgSender(), tokenId);
        _setTokenURI(tokenId, uri);
        emit TokenURIChanged(_msgSender(), tokenId, uri);
    }
}