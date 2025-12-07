// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract RomanToInteger {
    // 定义罗马字符到数值的映射
    mapping(bytes1 => uint256) private romanMapping;
    // 构造函数初始化，只执行一次
    constructor() {
        romanMapping['I'] = 1;
        romanMapping['V'] = 5;
        romanMapping['X'] = 10;
        romanMapping['L'] = 50;
        romanMapping['C'] = 100;
        romanMapping['D'] = 500;
        romanMapping['M'] = 1000;
    }

    function romanToInt(string memory str) public view returns (uint256) {
        // 将字符串转为字节数组
        bytes memory romanBytes = bytes(str);
        uint256 n = romanBytes.length;
        require(n > 0, "Empty input");

        uint256 result = 0; // 返回结果

        bytes1 currentChar; // 当前字符
        uint256 currentValue = 0; // 当前字符数值
        uint256 prevValue = 0;     // 上一个字符数值

        for (uint256 i = n - 1; i < n; i--) {
            currentChar = romanBytes[i];
            currentValue = romanMapping[currentChar];
            // 校验非罗马字符
            require(currentValue != 0, "Invalid Roman char");
            // 双指针，检查是否需要减法
            if (currentValue < prevValue) {
                result -= currentValue;
            } else {
                result += currentValue;
            }
            prevValue = currentValue;
            if (i == 0) {
                break;
            }
        }
        return result;
    }
}