// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract MyGame {

    uint public playerCount = 0;
    mapping (address => Player) public players;

    enum Level {Novice, Intermediate, Advanced} // now Level can have only one of these values.

    struct Player {
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
    }

    function addPlayer(string memory firstName, string memory lastName) public {
        players[msg.sender] = Player(msg.sender, Level.Novice, firstName, lastName);
        playerCount += 1;
    }

    function getPlayerLevel(address playerAddress) public view returns(Level) {
        return players[playerAddress].playerLevel;
    }
}

// constant: keyword added to a variable to tell solidity that its value cannot be changed.
// struct: struct types are used to represent a record, they allow you to create your own data type, kinda like objects in JS.
// enum: enums allow a variable to have only one of the predefined values, the values in the enum are 0-indexed.
// array: Players[] public players --> Here we are defining an array named players which can only contain elements of type Player.
