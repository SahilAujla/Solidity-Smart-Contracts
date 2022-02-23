// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Coin {
    address public minter;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    modifier onlyMinter {
        require(msg.sender == minter, "Only minter can call this function");
        _;
    }

    modifier amountLessThan(uint amount) {
        require(amount < 1e60);
        _;
    }

    modifier balanceGreaterThanAmount(uint amount) {
        require(amount <= balances[msg.sender], "Insufficient Balance.");
        _;
    }

    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public onlyMinter amountLessThan(amount) {
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public balanceGreaterThanAmount(amount) {
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}

// modifier: can be used to change the behaviour of functions in a declarative way. For example,
// you can use a modifier to automatically check a condition prior to executing the function.
// Though, they are defined in the same way as functions.
