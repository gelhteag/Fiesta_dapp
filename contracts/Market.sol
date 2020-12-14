
pragma solidity ^0.6.0;

import "../node_modules/openzeppelin-solidity/contracts/access/Ownable.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/IERC721.sol";
import "../node_modules/openzeppelin-solidity/contracts/utils/Counters.sol";
import "./FiestaERC721.sol";
import "./FiestaERC20.sol";

/**
 * @title Market
 * @notice Implements the Market board. The market is governed
 * by an ERC20  currency token, and an ERC721 token that represents the
 * ownership of the ticket (NFT) being bought or traded.
 */
contract Market  {
    event TradeStatusChange(uint256 ad, bytes32 status);


    FiestaERC721 fst;
    FiestaERC20 fstC;

    struct Trade {
        address poster;
        uint256 item;
        uint256 price;
        bytes32 status; // Open, Executed, Cancelled

    }
    struct InfoSupply {
       uint256 TicketSupply;
       uint256 TicketForSales;
       uint256 TicketNotForSales;
       uint256 TicketAvailable;
    }	

    mapping(uint256 => Trade) public trades;
    mapping(uint256 => InfoSupply) public infoSupply;
    mapping(uint256 => uint256) public idTicket;
    mapping(uint256 => bool) public saleStatus;
    mapping(uint256 => uint256) public soldBalancer;
 


    uint256 ticketCounter;
    uint256 ticketForSales;
    uint256 ticketNotForSales; 

    constructor (address _currencyTokenAddress, address _itemTokenAddress)
        public
        virtual
    {
        
        fst = FiestaERC721(_itemTokenAddress);
        fstC = FiestaERC20(_currencyTokenAddress);
        ticketCounter = 0;
        ticketForSales= 0;
        ticketNotForSales = 0;
        
    }
    
   
   
    
    
    /**
     * @dev Returns the NFT to the buyer address.
     * @param _ticketPrice The price of the NFT.
     */
    function buyTicket(uint256 _ticketPrice) public virtual  
    {
        
        fstC.transferFrom(msg.sender,address(this), _ticketPrice);	
        uint256 idT = fst.createTicket(msg.sender);
        idTicket[idT] = idT;
        soldBalancer[idT] = _ticketPrice;
        ticketNotForSales +=1;

    }
    
    /**
     * @dev Returns the FT to the buyer address.
     * @param _coin The amount of FT bought (FST token).
     */
    function buyCoin(uint256 _coin) public payable virtual  
    {
        uint256 amount = _coin * 1000 * (10 ** 18);
        fstC.mintFiesta(msg.sender,amount);
        soldBalancer[ticketCounter += 1] = amount;	        
    }
   

    /**
     * @dev Returns the details for a trade.
     * @param _trade The id for the trade.
     */
    function getTrade(uint256 _trade)
        public
        virtual
        view
        returns(address, uint256, uint256, bytes32)
    {   
    	require(saleStatus[_trade] == true ,"ticket not for sale");
        uint256 ticket = idTicket[_trade];
        Trade memory trade = trades[ticket];
        return (trade.poster, trade.item, trade.price, trade.status);
    }
    /**
     * @dev Returns the details of all the supply NFT.
     */
    function getInfo()
        public
        virtual
        
        returns(uint256, uint256, uint256, uint256)
    {   
    	infoSupply[ticketCounter] = InfoSupply({
	   TicketSupply: 1000,
           TicketForSales: ticketForSales,
           TicketNotForSales: ticketNotForSales,
           TicketAvailable: 1000 - ticketNotForSales + ticketForSales
	
	}); 
       
        
        return (infoSupply[ticketCounter] .TicketSupply, infoSupply[ticketCounter] .TicketForSales, infoSupply[ticketCounter] .TicketNotForSales, infoSupply[ticketCounter] .TicketAvailable);
    }
   
    
           

    
    /**
     * @dev Opens a new trade. Puts _item in escrow.
     * @param _item The id for the NFT to trade.
     * @param _price The amount of currency for which to trade the NFT.
     */
    function openTrade(uint256 _item, uint256 _price)
        public
        virtual
    {	
        ticketNotForSales -=1;
        ticketForSales += 1;
    	uint256 priceLimit = soldBalancer[_item] + (soldBalancer[_item] / 10) ;
    	require(_price <= priceLimit, "price can be 10% greater than the initial sell "); 
        fst.transferFrom(msg.sender, address(this), _item);
        trades[idTicket[_item]] = Trade({
            poster: msg.sender,
            item: _item,
            price: _price,
            status: "Open"
        });
	
       
        
        saleStatus[idTicket[_item]] = true;
        emit TradeStatusChange(idTicket[_item], "Open");
    }

    /**
     * @dev Executes a trade. Must have approved this contract to transfer the
     * amount of currency specified to the poster. Transfers ownership of the
     * NFT to the filler.
     * @param _trade The id of the NFT trade
     */
    function executeTrade(uint256 _trade)
        public
        virtual
    {   
        ticketNotForSales +=1 ;
        ticketForSales -=1 ;
        
        uint256 ticket = idTicket[_trade];
        Trade memory trade = trades[_trade];
       
        require(trade.status == "Open", "Trade is not Open.");
        require(trade.item == ticket , "Wrong ticket id");

        fstC.transferFrom(msg.sender,trade.poster , trade.price);
        fst.transferFrom(address(this), msg.sender, ticket);
       
        trades[_trade].status = "Executed";
        emit TradeStatusChange(_trade, "Executed");
        
    }
    /**
     * @dev Returns the details of all tickets put in sale on the Secondary market.
     */
    function getTicketForSale()
        public
        virtual
        view        
        returns(uint256[]  memory, uint256[]  memory)
    {   
        uint256[] memory a = new uint256[](1000);
        uint256[] memory b = new uint256[](1000);
        //uint table[ticketCounter];
        for(uint i = 0 ; i<1000; i++) 
        {
        Trade memory trade = trades[i];
        	if(trade.status == "Open")
        	{
        	    a[i] = trade.item;
        	    b[i] = trade.price;
        	    //return (trade.item, trade.price, ticketCounter);
        	}       
        }
        return (a,b);
     }
     // Not yet used
    /**
     * @dev Cancels a trade by the poster.
     * @param _trade The trade to be cancelled.
     */
    function cancelTrade(uint256 _trade)
        public
        virtual
    {
        Trade memory trade = trades[_trade];
        require(
            msg.sender == trade.poster,
            "Trade can be cancelled only by poster."
        );
        require(trade.status == "Open", "Trade is not Open.");
        fst.transferFrom(address(this), trade.poster, trade.item);
        trades[_trade].status = "Cancelled";
        emit TradeStatusChange(_trade, "Cancelled");
    }
}
