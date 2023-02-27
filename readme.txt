Voting System

Scenerio:
    We have an administrator who would add all those allowed to vote to this list,
    and when you vote, check first because somebody is on this list. 
    And if it's on the list, you vote, and you'll be removed from the list. 

Variables: 
    1. address public admin
        For set Address of Administrator.

    2. uint256 public voteCount
        Count number of Votes done by any user. Increment by 1
        everytime when vote Function successfully Ececuted.
    
    3. uint256 public allowedUserCount
        save number of users allowed to vote here.
        returns integer value on call.
    
    4. address[] allowedUsers
        array use to save address of all users allowed to vote here.
    
    5. mapping(address => bool) public allowed
        use to save list of allowed users.
        return true or false when call with any address.

    6. mapping(address => bool) public voted
        use to save list of users who have done there voteing.
        return true or false when call with any address.

Functions:
    1. addAllowed
        i.   need one argument type address.
        ii.  can only be called by Administrator because we use 
             onlyOwner modifier in function header.
        iii. returns an error message if called by any other user.
        iv.  check allowed mapping if voter already listed in allow list.
        v.   push user in allowedUsers array.
        vi.  set allowed mapping of this user to true.
        vii. increment by 1 on allowedUserCount variable.
        viii.returns true if successfully added.

    2. removeAllowed
        i.   need one argument type address.
        ii.  can only be called by Administrator because we use 
             onlyOwner modifier in function header.
        iii. returns an error message if called by any other user.
        iv.  check allowed mapping if voter listed in allow list.
        v.   pop user from allowedUsers array.
        vi.  set allowed mapping of this user to false.
        vii. decrement by 1 on allowedUserCount variable.
        viii.check if allowedUserCount is > 0. else return an error.
        ix.  returns true if successfully removed.

    3. vote
        i.   administrator not allowed to vote. if tried it returns an error.
        ii.  check if voter allowed
        iii. check allowedUserCount > 0
        iv.  check if user already voted. if tried again returns an error.
        v.   voted mapping for caller sets to true.
        vi.  voteCount increment by one.
        vii. allowedUserCount decrement by 1.
        viii.allowed mapping for caller sets to false
        ix.  pop the current user from allowed mapping.
        x.   returns true if function successfully executed

    4. totalAllowedList
        return all allowed user addresses.

Modifier:
    1. onlyOwner
        use to check if user is an administrator.
        administrator is defined in constructor and save in admin variable.