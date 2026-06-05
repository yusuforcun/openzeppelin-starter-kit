## Project 5: Economic Staking Logic

This project introduces economic logic to smart contracts by calculating rewards based on time and staked balance.

### Core Concepts
- **Snapshot Pattern:** Updating rewards before any state change to ensure accurate balance/reward ratios.
- **Economic Math:** Using time-based calculations to determine yield.
- **Safety:** Integrating `ReentrancyGuard` to prevent malicious actors from re-entering during balance updates.

### Professional Considerations
- **Immutable State:** Using `immutable` for tokens to save gas by storing data in code instead of storage.
- **Precision:** Addressing the lack of floating-point numbers in Solidity by scaling calculations.