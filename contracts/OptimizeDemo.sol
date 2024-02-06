// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract OptimizationDemo {
    uint256 public counter;

    // Unoptimized Solidity method
    function incrementUnoptimized() public {
        for (uint256 i = 0; i < 100; i++) {
            counter += 1;
        }
    }

    // Optimized Solidity method
    function incrementOptimized() public {
        counter += 100;
    }

    // Optimized Yul method
    function incrementYul() public {
        assembly {
            for { let i := 0 } lt(i, 100) { i := add(i, 1) }
            {
                sstore(counter.slot, add(sload(counter.slot), 1))
            }
        }
    }

    // // Optimized Huff method
    // // Note: Huff is a low-level language for Ethereum that allows for extreme optimization.
    // // However, it's not directly supported in Solidity. You would need to compile your Huff code
    // // to EVM bytecode and include it as inline assembly.
    // function incrementHuff() public {
    //     assembly {
    //         // EVM bytecode for incrementing the counter goes here
    //     }
    // }
}