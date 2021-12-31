// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract MyContract {
    address public owner;

    constructor () {
        owner = msg.sender;
    }

    // msg.value: number of wei sent

    modifier notOwner() {
        require(msg.sender != owner, "Owner can not pay himself.");
        _;
    }

    function fundMe(uint256 _amount) public notOwner {
        payable(owner).transfer(_amount);
    }
}