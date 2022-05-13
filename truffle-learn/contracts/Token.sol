// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Token {

  uint256 INITIAL_SUPPLY = 123456;
  mapping (address => uint256) public balances;
  constructor() {
    balances[msg.sender] = INITIAL_SUPPLY;
  }

  function transfer(address _to, uint256 _amount) public {
    assert(balances[msg.sender] >= _amount);
    balances[msg.sender] -= _amount;
    balances[_to] += _amount;
  }

  function getBalances(address _owner) public view returns (uint256) {
    return balances[_owner];
  }

}
