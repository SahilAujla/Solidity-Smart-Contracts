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
        uint createdTime;
    }

    function addPlayer(string memory firstName, string memory lastName) public {
        players[msg.sender] = Player(msg.sender, Level.Novice, firstName, lastName, block.timestamp);
        playerCount += 1;
    }

    function getPlayerLevel(address playerAddress) public view returns(Level) {
        Player storage player = players[playerAddress];
        return player.playerLevel;
    }

    function changePlayerLevel(address playerAddress) public {
        Player storage player = players[playerAddress];
        if (block.timestamp >= player.createdTime + 20) {
            player.playerLevel = Level.Intermediate;
        }
    }
}

// In this contract we can only change the level of the player after it has been created for atleast 20 seconds.
