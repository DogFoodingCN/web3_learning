import {configVariable, defineConfig} from "hardhat/config";
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
            chainType: "l1",
            // chainId: 11155111 ,
            // url: configVariable("SEPOLIA_RPC_URL"),
            // accounts: [configVariable("SEPOLIA_PRIVATE_KEY")],
            url:"https://sepolia.infura.io/v3/ddeaff56b8f847918cb455b4f62f1fe5",
            accounts:["0xe22a2b8c0825fc95390578bfdbcd8cf9311932e16bbd1d22e3bf5b1d61fdd34a"],
        },
    },
    verify: {
        etherscan: {
            // apiKey: configVariable("ETHERSCAN_API_KEY"),
            apiKey: "TCU9NJPQC7MMM15PR34H31Z9ABP95G7Q6J",
        },
        // blockscout: {
        //     enabled: false,
        // }
    }
});
