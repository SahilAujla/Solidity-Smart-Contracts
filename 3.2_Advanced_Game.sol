// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract MyGame {

    uint public playerCount = 0;
    mapping (address => Player) public players;

    string[] public novicePlayers;
    string[] public intermediatePlayers;
    string[] public advancedPlayers;


    enum Level {Novice, Intermediate, Advanced} // now Level can have only one of these values.

    struct Player {
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
    }

    function addPlayer(string memory firstName, string memory lastName) public {
        players[msg.sender] = Player(msg.sender, Level.Novice, firstName, lastName);

        if (players[msg.sender].playerLevel == Level.Novice) {
            novicePlayers.push(firstName);
        } 
        else if (players[msg.sender].playerLevel == Level.Intermediate) {
            intermediatePlayers.push(firstName);
        } 
        else if (players[msg.sender].playerLevel == Level.Advanced) {
            advancedPlayers.push(firstName);
        }

        playerCount += 1;
    }

    function getPlayerLevel(address playerAddress) public view returns(string memory) {
        return players[playerAddress].lastName;
    // {0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2: {0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 0, "Rahul", "Pathak"}}
    }

    function getNovicePlayers() public view returns (string[] memory) {
        return novicePlayers;

    }

    function getIPlayers() public view returns (string[] memory) {
        return intermediatePlayers;

    }

    function getAPlayers() public view returns (string[] memory) {
        return advancedPlayers;

    }
}
