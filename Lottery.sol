// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    // startLottery --> onlyOwner
    // buyTicket
    // 2% in smart contract baki ka winner ko
    // endLottery --> onlyowner

    address owner;
    uint startTime;
    uint endTime;

    address[] allAddresses;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function startLottery(uint lotteryPeriod) public onlyOwner {
        startTime = block.timestamp;
        endTime = startTime + lotteryPeriod;
    }

    function buyTicket() public payable {
        require(block.timestamp < endTime, "Lottery period has ended");
        require(msg.value == 1 ether, "You can only buy ticket for 1 ether");
        allAddresses.push(msg.sender);
    }

    function endLottery() public payable onlyOwner returns (bool) {
        // random number generate - length at max -- array length
        // transfer 98% to the winner

        require(block.timestamp > endTime, "Lottery period is not yet ended");

        uint indexOfWinner = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % allAddresses.length;

        address winner = allAddresses[indexOfWinner];

        // 2 % of total = (2 /100) * total

        // 98 % = total - (2 * total) / 100 = (98 * total) / 100

        uint amountToTransfer = (98 * address(this).balance) / 100;

        (bool sent,) = winner.call{value: amountToTransfer}("");

        return sent;
    }

    function withdraw() public payable onlyOwner returns(bool) {
        (bool sent,) = owner.call{value: address(this).balance}("");
        return sent;
    }

    function contractBalance() public view returns (uint) {
        return address(this).balance;
    }
}
