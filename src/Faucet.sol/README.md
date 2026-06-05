## Project 3: Rate-Limited Faucet System

This project implements a secure ETH faucet that prevents abuse through time-based cooldowns and protects against reentrancy attacks.

### Objective
To implement state management for user interactions and enforce security measures to prevent contract abuse.

### Technical Stack
- **Solidity:** ^0.8.20
- **Libraries:** OpenZeppelin `Ownable.sol`, `ReentrancyGuard.sol`
- **Framework:** Foundry

### Core Features
- **Rate Limiting:** Users are restricted to one claim every 24 hours using `block.timestamp`.
- **Reentrancy Protection:** Utilizes `ReentrancyGuard`'s `nonReentrant` modifier to prevent recursive calls during ETH transfers.
- **Admin Control:** Owners can withdraw remaining funds using `withdrawAll`.

### Security Mechanisms
- **nonReentrant:** Prevents attackers from exploiting the withdrawal flow.
- **Cooldown Logic:** Ensures fair distribution and prevents automated spam attacks.

### Test Coverage
- `test_CannotClaimTwice`: Ensures users cannot bypass the cooldown period.
- `test_CooldownResetsAfterTime`: Verifies the system correctly permits claims after the cooldown has expired using `vm.warp`.