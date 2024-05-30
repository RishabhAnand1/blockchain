// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract FavNumber {
    string[] public names;
    mapping(string => uint) public nameToNum;

    // Function to add a new name and associated number
    function addNameAndNumber(string memory name, uint num) public {
        names.push(name);
        nameToNum[name] = num;
    }

    function getNumFromName(string memory name) public view returns (uint) {
        return nameToNum[name];
    }

    // Function to retrieve the total number of names in the array
    function getNamesCount() public view returns (uint) {
        return names.length;
    }
}
