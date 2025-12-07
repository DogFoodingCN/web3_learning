// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// 讨饭合约
contract BeggingContract {

    address public owner; // 合约所有者；
    uint256 public totalDonated; // 总捐赠金额
    mapping(address => uint256) public donations; // 一个 mapping 来记录每个捐赠者的捐赠金额。

    modifier onlyOwner() {
        require(msg.sender == owner, "only owner can call");
        _;
    }

    // 初始化
    constructor () {
        owner = msg.sender;
    }

    event Donation(address indexed donor, uint256 amount); // 捐赠事件
    event Withdraw(address indexed owner, uint256 amount); // 提现事件

    // 一个 donate 函数，允许用户向合约发送以太币，并记录捐赠信息。
    function donate() public payable {
        require(msg.value > 0, "donate amount must more than 0");
        donations[msg.sender] += msg.value;
        totalDonated += msg.value;
        emit Donation(msg.sender, msg.value);
    }

    // 一个 withdraw 函数，允许合约所有者提取所有资金。
    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "withdraw amount must be more than 0");
        emit Withdraw(owner, balance);
        (bool success, ) = owner.call{value: balance}("");
        require(success, "Begging withdraw failed");
        totalDonated = 0;
    }

    // 一个 getDonation 函数，允许查询某个地址的捐赠金额。
    function getDonation(address _donor) external view  returns(uint256) {
        return donations[_donor];
    }

    // 查看总余额
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

}