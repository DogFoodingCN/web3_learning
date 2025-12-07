// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Voting {
    // 存储候选人的票数
    mapping(address => uint256) private votes;

    // 存储候选人地址的数组
    address[] private candidates;

    // 记录地址是否为候选人
    mapping(address => bool) private isCandidate;

    // 投票事件
    event Voted(address indexed voter, address indexed candidate);
    // 重置票数事件
    event VotesReset(address indexed resetter);

    // 投票函数，允许用户给指定候选人投票
    function vote(address candidate) public {
        require(candidate != address(0), "Invalid candidate address");

        // 如果是新候选人，添加到候选人列表
        if (!isCandidate[candidate]) {
            candidates.push(candidate);
            isCandidate[candidate] = true;
        }
        votes[candidate]++;
        emit Voted(msg.sender, candidate);
    }

    // 获取指定票选人的得票数
    function getVotes(address candidate) public view returns (uint256) {
        return votes[candidate];
    }

    // 重置所有候选人的得票数
    function resetVotes() public {
        for (uint256 i = 0; i < candidates.length; i++) {
            votes[candidates[i]] = 0;
        }
        emit VotesReset(msg.sender);
    }

}