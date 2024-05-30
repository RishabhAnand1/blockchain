// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Numbers {
  // static 
  uint[] public nums = [1, 2, 3, 4, 5, 6, 7, 8];
  mapping(uint => uint) public numMap;
  mapping(uint => string) public numtoStrMap;


  // setter for Nums
  function setNums(uint ele) public {
    nums.push(ele);
  }
  // getter for Nums
  function getNums(uint index) public view returns (uint) {
    return nums[index];
  }


  // setter for numMap
  function setNumMap(uint key, uint value) public {
    numMap[key] = value;
  }
  // setter for numMap
  function getNumMap(uint key) public view returns (uint) {
    return numMap[key];
  }



  // setter for numstoStrMap
  function setNumtoStrMap(uint key, string memory value) public {
    // value="asfga";
    numtoStrMap[key] = value;
  }
  // getter for numstoStrMap
  function getNumtoStrMap(uint key) public view returns (string memory) {
    return numtoStrMap[key];
  }


  // function setNumtoStrMap(uint key, string calldata value) public {
  //   value="asfga";
  //   numtoStrMap[key] = value;
  // } 
  // when we define it as calldata, value cannot be changed inside the function. We can only use memory or storage


}
