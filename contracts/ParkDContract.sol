// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title ParkDContract
 * @dev Implements query() and registerSpot() transactions for ParkD application
 */
contract ParkDContract {
   
    struct Reservation {
        uint resTimeIn;
        uint resTimeOut;
        address guestID;
    }
    
    struct Spot {
        uint ID;
        string LatLong;
        string Address;
        string Type;
        // Photos
        // address is string on hyperledger
        address HostID;
        address GuestID;
        uint Price;
    }

    Spot[] internal spots;
    mapping(uint => Reservation[]) public reservations;

    function query() public view returns(Spot[] memory) {
        return spots;
    }

    function getReservations(uint spotID) public view returns(Reservation[] memory) {
        return reservations[spotID];
    }

    // 0, 199999, 200000, 0x9e06438DDB4793D37F7D633F00AEb2cb84bE8C8C
    function makeReservation(uint spotID, uint resTimeIn, uint resTimeOut, address guestID) public {
        // Reservation[] memory temp;
        Reservation memory r = Reservation({
            resTimeIn: resTimeIn,
            resTimeOut: resTimeOut,
            guestID: guestID
        });
        // temp.push(r);
        reservations[spotID].push(r);
    }

    // "32.782820_-79.938293", "58 Coming St, Charleston, South Carolina", "Street", 5
    function registerSpot(string memory LatLong, string memory Address, string memory Type, uint Price) public returns(uint){
        // Reservation[] memory tmp;
        Spot memory s = Spot({
            ID: spots.length,
            LatLong: LatLong,
            Address: Address, 
            Type: Type,
            HostID: msg.sender,
            GuestID: address(0),
            Price: Price
        });
        spots.push(s);
        return spots.length - 1;
    }


}
