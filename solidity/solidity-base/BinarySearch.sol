// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract BinarySearch {

    function binarySearch(uint256[] memory arr, uint256 target) public pure returns(int256) {
        // 如果数组为空，直接返回
        if (arr.length == 0) {
            return -1;
        }

        // 双指针
        int256 left = 0;
        int256 right = int256(arr.length) - 1;

        while (left <= right) {
            // 计算中间值
            int256 mid = left + (right - left) / 2;

            // 找到目标值，返回索引
            if (arr[uint256(mid)] == target) {
                return mid;
            }

            // 如果中间值小于目标值，在右半部分查找
            if (arr[uint256(mid)] < target) {
                left = mid + 1;
            }

            // 如果中间值大于目标值，在左半部分查找
            if (arr[uint256(mid)] > target) {
                right = mid - 1;
            }
        }
        // 没有找到目标值，返回 -1
        return -1;
    }
}