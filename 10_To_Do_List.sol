// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ToDoList {
    
    mapping(address => string[]) public allTasks;

    function setTask(string memory task) public {
        allTasks[msg.sender].push(task);
    }

    function getTasks() public view returns (string[] memory) {
        return allTasks[msg.sender];
    }
}
