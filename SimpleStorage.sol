// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract SimpleStorage {

    struct User {
        string name;
        uint8 age;
    }

    User[] private  users;
    mapping (uint8 => string[]) private usersByAge;

    function addUser(string memory name, uint8 age) public {
        users.push(User({name: name, age: age}));
        if (hasUserWithThisAge(age)) {
            usersByAge[age].push(name);
        } else {
            usersByAge[age] = [name];
        }
    }

    function getUsersNumber() public view returns (uint8) {
        return uint8(users.length); 
    }

    function getUserByAge(uint8 age) public view returns (string [] memory) {
        return usersByAge[age]; 
    }

    function hasUserWithThisAge(uint8 age) public view returns (bool) {
        return usersByAge[age].length > 0; 
    }
    
    // View funtion only read the state, no change or save data
    function getPerson() public pure returns (User memory) {
        return  User ("Person Name",100);
    }

    // Pure function can't read or modify data
    function getDay(string memory date) public pure returns (string memory) {
        return date;
    }
}
