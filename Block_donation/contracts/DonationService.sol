pragma solidity ^0.5.0;

import "./BlockDonation.sol";

contract DonationService is BlockDonation {
     
     uint numCampaigns;
     mapping(uint=>campaign) public campaigns;
     
     struct campaign{
     string campaign_name;
     address campaign_address;
     uint numFunders;
     mapping(uint => funder) funders;
     }
     
     struct funder{
        address addr;
        uint amount;
        uint total_fund;
     }
     
     uint Trx_index;
     mapping (uint =>usage) public Trx_usage;
     
     struct usage{
     string usage_to;
     uint usage_value;
     }
    
     
    function newCampaign(string memory campaign_name, address beneficiary) public returns (uint campaignID){
        campaignID = numCampaigns++;
        campaigns[campaignID] = campaign(campaign_name,beneficiary,0);
    }
    
    function contribute(uint campaignID, uint _amount) public{
        campaign storage c = campaigns[campaignID];
        // Creates a new temporary memory struct, initialised with the given values
        // and copies it over to storage.
        // Note that you can also use Funder(msg.sender, msg.value) to initialise.
        
        c.funders[c.numFunders++] = funder({addr: msg.sender, amount: _amount, total_fund:0 });
        transfer(c.campaign_address,_amount);
    }
    event use_money_log(uint send_amount, string usage);
    function use_money(uint _amount, string memory _usage) public{
         
         Trx_usage[Trx_index].usage_to = _usage;
         Trx_usage[Trx_index].usage_value = _amount;
         Trx_index ++;
        _burn(msg.sender,_amount);
        emit use_money_log(_amount,_usage);
    }

     

}