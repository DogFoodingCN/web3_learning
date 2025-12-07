// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ReverseString {

    function reverseString(string memory inputStr) public pure returns(string memory) {
        // 将字符串转换为字节数组
        bytes memory inputBytes = bytes(inputStr);
        // 创建输出字符串字节数组
        bytes memory outputBytes = new bytes(inputBytes.length);

        // 反转字符串
        for (uint256 i = 0; i < inputBytes.length; i++) {
            outputBytes[i] = inputBytes[inputBytes.length - i - 1];
        }

        // 将字节数组转换为字符串输出
        return string(outputBytes);
    }

}