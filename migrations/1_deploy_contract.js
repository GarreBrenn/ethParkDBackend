const ParkDContract = artifacts.require("ParkDContract");

module.exports = function (deployer) {
  deployer.deploy(ParkDContract);
};
