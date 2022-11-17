//SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;
import "hardhat/console.sol";

//smart contract that allows a user to deposit, check balance and withdraw ETH!!
contract SmartBankContract{
    //mapped the address of the caller balance in the contract
    mapping(address => uint) public balances;

    function deposit() public payable{
        balances[msg.sender] += msg.value; 
        console.log("Successfully Deposited: ", msg.value, "Wei");
        console.log("Updated Balance: ", balances[msg.sender], "Wei");
    }

    function withdraw(uint _amount) public{
        //we create a require arg to make sure the balance of the sender is >= _amount if not throw ERR
        require(balances[msg.sender]>= _amount, "Not enough Ether");
        
        balances[msg.sender] -= _amount;

        //True bool is called to confirm the amount
        (bool sent,) = msg.sender.call{value: _amount}("Sent");
        require(sent, "failed to send ETH");

        if(sent){
            uint updatedBalance = balances[msg.sender];
            console.log("Successfully Withdrawn", _amount, "Wei");
            console.log("Remaining Balance: ", updatedBalance, "Wei");
        } else {
            console.log("Failed to Withdraw");
        }
    }
    
    function getBal() public view returns(uint){
        uint currBalance = address(this).balance;
        uint ethBalance = currBalance/1000000000000000000;
        uint weiBalance = currBalance%1000000000000000000;
        console.log("Current Overall Balance: ", currBalance, "Wei");
        console.log(ethBalance, " ETH and ", weiBalance, " Wei in Account");
        return currBalance;
    }
}