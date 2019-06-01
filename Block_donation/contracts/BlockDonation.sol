pragma solidity ^0.5.0;

import "./Ownable.sol";
import "./ERC20Burnable.sol";

  contract BlockDonation is ERC20Burnable,Ownable {

  string public name             = "BlockDonation";
  string public symbol           = "BD";
  uint   public decimals         = 18;
  uint   public startTime ;
  
 
  
  constructor() public
  { 
    startTime = now;
    _mint(msg.sender, 10000000000);
  }   
    
    event _ownerincrease( uint _amount);
    
    function ownerincrease(uint _amount) public onlyOwner{ //owner can increase its token whenever he wants
        _mint(msg.sender, _amount);
        emit _ownerincrease( _amount);
    }
    
    event _ownerdecrease(uint _amount);
    
    function ownerdecrease(uint _amount) public onlyOwner{
        _burn(msg.sender, _amount);
        emit _ownerdecrease(_amount);
    }
    
   /* event owner_Approval(address owner, address spender, uint value);
    
      function owner_approve(uint256 value) internal onlyOwner returns (bool) {
        _allowed[msg.sender][spender] = value;
        emit owner_Approval(msg.sender, spender, value);
        return true;
    }*/
   
}





