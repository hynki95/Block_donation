const BlockDonation = artifacts.require("BlockDonation");
const DonationService = artifacts.require("DonationService");


module.exports = function(deployer) {
  deployer.deploy(BlockDonation);
  deployer.deploy(DonationService);
};
