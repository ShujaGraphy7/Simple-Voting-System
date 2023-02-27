// // SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract VotingSystem {

    // public function also act like getter function 
    // so no need to define functions for get these informations
    address public admin;
    uint256 public voteCount;
    uint256 public allowedUserCount;
    address[] allowedUsers;
    mapping(address => bool) public allowed;
    mapping(address => bool) public voted;

    // this constructor function only called once when we deploy the contract...
    // admin variable assined with the address of user who deploy this function...
    constructor() {
        admin = msg.sender;
    }
     // when we use this modifier in any of our
    // function definition then only admin can call those function.
    // if any one else call those function it returns error "Only admin can call this function"
    modifier onlyOwner() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    /*
    /   this function can only be called by the admin because of onlyOwner modifier...
    /   check if not allowed then add to the allowed list and 
    /   incremented by 1 from allowedUserCounter variable...
    /   return true if user not listed before else error "Voter already allowed"	*/

    function addAllowed(address user) public onlyOwner returns (bool) {
        require(!allowed[user], "Voter already allowed");
            allowedUsers.push(user);
            allowed[user] = true;
            allowedUserCount++;
            return true;
    }

    /*
    /   this function can only be called by the admin because of onlyOwner modifier...
    /   check if allowedUserCounter variable value is greater then 1. if fails return error "List is already empty"
    /   check if allowed then remove from allowed list and decrement by 1 from allowedUserCounter variable
    /   return true if user is listed before else error "Voter not allowed" or "List is already empty"
    */

    function removeAllowed(address user) public onlyOwner returns (bool) {
        require(allowedUserCount > 0, "List is already empty");
        require(allowed[user], "Voter not allowed");
         allowed[user] = false;
         allowedUserCount--;
         for(uint256 i; i < allowedUsers.length; i++){
         if(allowedUsers[i]== user){
         allowedUsers[i] = allowedUsers[allowedUsers.length -1];
         allowedUsers.pop();
         break ;
      }
      }
        return true;
    }

    /*
    /   this function can be called by any registered/allowed user...
    /   admin is not allowed to called this function...
    /   check if there is any user in the list...
    /   check if allowed then voteCount variable automatically incremented by 1
    /   return true if user successfully voted else 
            error
                "Admin not allowed to vote here"
                or "Voter not allowed"
                or "No one is in the list"
                or "Voter already voted / not allowed"    	*/

    function vote() public returns (bool) {
        require(msg.sender != admin, "Admin not allowed to vote here");
        require(allowed[msg.sender], "Voter not allowed");
        require(allowedUserCount > 0, "No one is in the list");
        require(!voted[msg.sender], "Voter already voted / not allowed");
        voted[msg.sender] = true;
        voteCount++;
        allowedUserCount--;
        allowed[msg.sender] = false;
        
        for(uint256 i; i < allowedUsers.length; i++){
         if(allowedUsers[i]== msg.sender){
         allowedUsers[i] = allowedUsers[allowedUsers.length -1];
         allowedUsers.pop();
         break ;
      	}
      }
        return true;
    }
    
    //to get the list of total voters.
    function totalAllowedList()external view returns(address[] memory){
        return allowedUsers;
    }
   
}
