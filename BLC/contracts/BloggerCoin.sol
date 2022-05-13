// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "zeppelin-solidity/contracts/token/ERC20/StandardToken"

contract BolggerCoin {
  string public name = "BloggerCoin";
  string public symbol = "BLC";
  uint8 public decimals = 4;
  uint256 public INITIAL_SUPPLY = 66666;
  contructor() {
    totalSupply = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }
}
