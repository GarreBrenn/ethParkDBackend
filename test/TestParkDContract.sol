// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ParkDContract.sol";

contract TestParkDContract {
  function testSpotRegistration() public {
    ParkDContract parkd = ParkDContract(DeployedAddresses.ParkDContract());

    uint expectedSpotID = 0;

    Assert.equal(parkd.registerSpot("32.782820_-79.938293", "58 Coming St, Charleston, South Carolina", "Street", 5), 
    expectedSpotID, "The initial SpotID with one spot added should be 0");
  }

  function testMakeReservation() public {
    ParkDContract parkd = ParkDContract(DeployedAddresses.ParkDContract());

    uint spotID = parkd.registerSpot("32.782820_-79.938293", "58 Coming St, Charleston, South Carolina", "Street", 5);
    parkd.makeReservation(spotID, 957358800000, 9574452000000, address(this));

    Assert.notEqual(parkd.getReservations(spotID).length, 0, "If a res is made, len(res[0]) should be > 0");
  }
}