// SPDX-License-Identifier: MIT
pragma solidity ^0.8.35;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract AdminPanel is Ownable {
    uint256 public systemStatus ;
    mapping(address => bool) public blacklist ;

    event StatusChanged(uint256 newStatus);
    event UserBlacklisted(address indexed user);

    constructor() Ownable(msg.sender){}

    function setSystemStatus(uint256 _status) external onlyOwner {
        systemStatus = _status ;
        emit StatusChanged(_status);
    }

    function addToBlacklist(address _user) external onlyOwner {
        blacklist[_user] = true;
        emit UserBlacklisted(_user);
    }


}