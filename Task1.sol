pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

contract DonateFund {
    address public owner;
    uint256 public balance;
    address public association = address(this);
    
    constructor() {
        owner = msg.sender;

    }
    receive() payable external {
        balance += msg.value;
    }


    function withdraw (uint amount, address payable _owner) public  {
        require (msg.sender == _owner, "Only the association can withdraw money");
        require (amount <= balance, "Insufficient funds,Please try again");
        _owner.transfer(amount);
        balance -=amount;
    }
  

}