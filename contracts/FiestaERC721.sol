pragma solidity ^0.6.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";
import "../node_modules/openzeppelin-solidity/contracts/utils/Counters.sol";

contract FiestaERC721 is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    /**
     * Note that this ERC721 is  deflationary , the supply is fixed to 1000 !
     * 
     */
    
    constructor() public ERC721("FiestaNFT", "FSTN") {}
   
    
    /**
     * @dev Approves another address to transfer the given token ID.
     * @param _receiver address of the new owner wich will received, _idTicket ID of the token to be owned.
     */ 
    function approveNewOwner(address _receiver, uint256 _idTicket) 
        public 
    {
        approve(_receiver,_idTicket);   
    }
    /**
     * @dev mint a new nft and send it to its buyer.
     * @param _marketAddress address of the buyer.
     */ 
    function createTicket(address _marketAddress) 
        public  
        returns  (uint256)
    {
        uint256 liMint = _tokenIds.current();
        require(liMint <= 1000,"SOLD OUT");
        _tokenIds.increment();
        uint256 newTicket = _tokenIds.current();
        _mint(_marketAddress, newTicket);
        return newTicket;
   }
}

