// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract HelloWorld {

  function test() public pure returns (string memory) {
    return "Hello world";
  }

  function test1() public returns (string memory) {
    return "Hello world1";
  }

  function echo(string memory s) public returns (string memory) {
    return s;
  }
}
