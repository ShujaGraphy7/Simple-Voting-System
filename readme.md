# Voting System Solidity Contract
This is a simple Solidity contract that implements a basic voting system. It allows the admin to add and remove users from the list of allowed voters, and allows registered users to cast their votes. This contract is released under the MIT License.

## Getting Started
To use this contract, you will need a Solidity compiler such as Remix IDE. You can also use other Solidity compilers and tools.
## Variables
#### admin 
This is an address type variable that holds the address of the user who deployed the contract. The value of this variable is set in the constructor function and is used in the onlyOwner modifier to restrict access to certain functions.

#### voteCount
This is an uint256 type variable that keeps track of the total number of votes cast by the users.

#### allowedUserCount
This is an uint256 type variable that keeps track of the total number of users who are allowed to vote.

#### allowedUsers
This is an array of address type variables that holds the addresses of users who are allowed to vote.

#### allowed
This is a mapping of address type keys to bool type values. It keeps track of whether a particular user is allowed to vote or not.

#### voted
This is a mapping of address type keys to bool type values. It keeps track of whether a particular user has already cast their vote or not.

The variables** admin, voteCount, allowedUserCount, allowedUsers, allowed,** and **voted** are all declared as public, which means that they can be accessed outside the contract and act as getter functions. This eliminates the need to define separate getter functions for these variables.
## Functionality
#### Constructor
The constructor function initializes the contract by assigning the admin variable to the address of the user who deploys the contract.

#### onlyOwner Modifier
This modifier is used in the function definitions to ensure that only the admin can call certain functions. If any other user tries to call these functions, an error message "Only admin can call this function" is returned.

#### addAllowed Function
This function can only be called by the admin using the onlyOwner modifier. If the user is not already allowed to vote, this function adds the user to the list of allowed voters and increments the allowedUserCount variable. If the user is already listed, an error message "Voter already allowed" is returned.

#### removeAllowed Function
This function can only be called by the admin using the onlyOwner modifier. If the allowedUserCount variable is greater than 0, this function removes the user from the list of allowed voters and decrements the allowedUserCount variable. If the user is not already listed, an error message "Voter not allowed" is returned. If there are no users in the list, an error message "List is already empty" is returned.

#### vote Function
This function can be called by any registered/allowed user. If the user is the admin, an error message "Admin not allowed to vote here" is returned. If the user is not listed in the allowed users list, an error message "Voter not allowed" is returned. If there are no users in the list, an error message "No one is in the list" is returned. If the user has already voted, an error message "Voter already voted / not allowed" is returned. Otherwise, the user is allowed to vote, and the voteCount variable is incremented by 1. The user is then removed from the allowed users list, and the allowedUserCount variable is decremented.

#### totalAllowedList Function
This function returns the list of all allowed users who can vote.

## License
This contract is released under the MIT License. Please see the LICENSE file for more information.
