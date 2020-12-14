pragma solidity ^0.6.2; 

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";


contract FiestaERC20 is ERC20 {


    
    constructor() public ERC20("Fiesta", "FST	") {}
    
     /**
     * Note that this ERC20 is an inflacionary token, no fix supply !
     * 
     */
    /**
     * @dev mint a amount "value" and send it to _address .
     * @param _address address of the receiver, value is the amount mint.
     */
    function mintFiesta(address _address, uint256 _value) public  {_mint(_address, _value);}    
    /**
     * @dev Automically increases the allowance granted to spender by the caller.
     * @param _address address of spender, value is the amount allow.
     */
    function incAllow(address _address, uint256 _value)  public {increaseAllowance(_address,_value);}
    
    /**
     * @dev Returns the balance of msg.sender.
     * @param _address address of msg.sender.
     */
    function balanceW(address _address)    public view returns (uint256) {uint256 balance = balanceOf(_address); return balance;}   


}
   
