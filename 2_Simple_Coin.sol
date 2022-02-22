// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Coin {
    address public minter;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient Balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}

/*

address: The public address of every person

mapping: just like dictionary in pyhton, used to store key-value pairs like
addresses and balances associated with them.

event: when you call an event, it causes its arguments to log into the transaction's log
(which can be accessed as long as the block is available: theoratically forever).

emit: keyword required to call events

msg: keyword that allows us to access some special variables that are available for us from the blockchain.

require: convienience function in solidity, it guarantees validity of conditions that cannot be detected before execution.

constructor: function that is run directly when the contract is created.

*/
