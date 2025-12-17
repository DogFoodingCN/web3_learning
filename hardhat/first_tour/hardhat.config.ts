import {defineConfig} from "hardhat/config";
import hardhatToolboxViemPlugin from "@nomicfoundation/hardhat-toolbox-viem";
import hardhatVerify from "@nomicfoundation/hardhat-verify";

export default defineConfig({
    plugins: [
        hardhatVerify,
        hardhatToolboxViemPlugin,
    ],
    solidity: {
        version: "0.8.28",
    },
    networks: {
        sepolia: {
            type: "http",
            url:"https://rpc.sepolia.org",
            accounts:["0xe22a2b8c0825fc95390578bfdbcd8cf9311932e16bbd1d22e3bf5b1d61fdd34a"],
        },
    },
    verify: {
        etherscan: {
            apiKey: "TCU9NJPQC7MMM15PR34H31Z9ABP95G7Q6J",
        },
        blockscout: {
            enabled: false,
        }
    }
});
