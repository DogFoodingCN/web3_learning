// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract IntegerToRoman {

    function intToRoman1(uint256 num) public pure returns (string memory) {
        // 检查输入范围，罗马数字表示范围 1～3999
        require(num >= 1 && num <= 3999, "Number must between 1 and 3999");

        string[4] memory thousands = ["", "M", "MM", "MMM"];
        string[10] memory hundreds = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"];
        string[10] memory tens = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"];
        string[10] memory ones = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"];
        // 硬编码拆解数字
        return string.concat(
            thousands[num/1000],
            hundreds[num%1000/100],
            tens[num%100/10],
            ones[num%10]
        );
    }

    function intToRoman2(uint256 num) public pure returns (string memory) {


    }

}