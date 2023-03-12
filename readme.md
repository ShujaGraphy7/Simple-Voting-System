# Voting System Solidity Contract
This is a simple Solidity contract that implements a basic voting system. It allows the admin to add and remove users from the list of allowed voters, and allows registered users to cast their votes. This contract is released under the MIT License.

## Getting Started
To use this contract, you will need a Solidity compiler such as Remix IDE. You can also use other Solidity compilers and tools.

## FunctionalityFunctionality
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

## LicenseLicense
This contract is released under the MIT License. Please see the LICENSE file for more information.
