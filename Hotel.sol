pragma solidity ^0.8.6;

contract HotelRoom {
       
        address payable public owner;
        //vacant or occupied
        enum Statuses {
            Vacant, 
            Occupied
        };
        Statuses currentStatus;
        
        //events
        event Occupy(address _occupant, uint _value);


        constructor() public{
                owner = msg.sender;
                currentStatus = Statuses.Vacant;
        }

        modifier onlyWhileVacant {
            require(currentStatus = Statuses.Vacant, "Currently occupied");
        }

        modifier priceCheck(uint _amount ) {
                     require(msg.value >=  _amount, "you need more ether. Not enough ether provided.");
        }

        function book() payable onlyWhileVacant, priceCheck(2 ether) {
         
                //pay owner to book hotel room
                currentStatus = Statuses.Occupied;
                owner.transfer(msg.value);
                emit Occupy(msg.sender, msg.value);

        }

}


