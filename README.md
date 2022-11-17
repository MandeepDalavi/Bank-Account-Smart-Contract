# Bank-Account-Smart-Contract

A dynamic contract that allows User to Deposit and withdraw ETH!!

##### In creating a simple Dynamic Secure bank we must take note of the following, which are
- **DEPOSIT**
- **WITHDRAW**
- **BALANCE**

We will start by understanding how to DEPOSIT into our smart contract, the key thing here is we must first map our address to the sender, after mapping we must create a function.

Notice we signed the address to a Uint(unsigned integer)

### DEPOSIT
We create a function and make a payable because we are sending ETH to the contract, we open the function and make it public since we want anyone to call it
```sh
name[msg.sender]+=msg.value;
```

we said name of sender, whatever value of ETH should be added to Value of sender.

You can compile and test at this point and see what we have done.

### WITHDRAW
we create a new function called withdraw and make it public since we want anybody to call the function

we call an arg and assign it an UINT opening the fucntion we require that whoever deposited can only collect their balance only by saying
```sh
require(name[msg.sender]>=_arg,"ERR");
```

we call tthen minus the amount withdraw from Bal like so, name
```sh
[msg.sender]-=_arg;
```

We create an statement `(bool sent,) = msg.sender.call{value: _arg}("sent");` to optimise our contract and allow the contract to be true:
```sh
require(sent, "ERR");
```

### BALANCE
Although we have a balance function created for us when we mapped the address to the Balances at the top we need to insert the address to see the balance but atleast create customized balance call

create a new function and then call 
```sh
return(address(this).balance);
```