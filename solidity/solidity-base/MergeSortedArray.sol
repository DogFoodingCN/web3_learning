// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract MergeSortedArray {

    function mergeSortedArray (uint256[] memory arr1, uint256[] memory arr2) public pure returns(uint256[] memory) {
        // 结果数组 + 双指针处理
        uint256[] memory result = new uint256[](arr1.length + arr2.length);

        uint256 i = 0;  // arr1 指针
        uint256 j = 0;  // arr2 指针
        uint256 k = 0;  // result 指针

        // 比较两个数组的元素，将较小的放入结果数组
        while (i < arr1.length && j < arr2.length) {
            if (arr1[i] <= arr2[j]) {
                result[k] = arr1[i];
                i++;
            } else {
                result[k] = arr2[j];
                j++;
            }
            k++;
        }

        // 将剩余的数组元素直接合到结果中
        while (i < arr1.length) {
            result[k] = arr1[i];
            i++;
            k++;
        }
        while (j < arr2.length) {
            result[k] = arr2[j];
            j++;
            k++;
        }

        return result;
    }
}