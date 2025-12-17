// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Counter} from "./Counter.sol";
import {Test} from "forge-std/Test.sol";


contract CounterTest is Test {
    Counter counter;

    function setUp() public {
        counter = new Counter();
    }

    function test_InitialValueIsZero() public view {
        require(counter.x() == 0, " x should start at 0");
    }

    function test_IncreasesByOne() public {
        counter.inc();
        require(counter.x() == 1, " inc should increase x by 1");
    }

    function test_IncreasesByGivenAmount() public {
        counter.incBy(3);
        require(counter.x() == 3, " incBy should increase x by given amount");
    }

    function test_IncEmitsIncrementEvent() public {
        vm.expectEmit();
        emit Counter.Increment(2);

        counter.incBy(2);
    }

    function testFuzz_Inc(uint8 x) public {
            for (uint8 i =0; i < x; i++) {
                    counter.inc();
            }
        require(counter.x() == x, " value after call inc x should be x");
    }
}