## Project 2: Mintable ERC20 Token

This project focuses on implementing a standard ERC20 token with controlled supply mechanics using OpenZeppelin's battle-tested libraries.

### Core Features
- **ERC20 Standard:** Fully compliant implementation of transfer, balance, and allowance logic.
- **Mint Control:** Restricted `mint` function ensuring only the contract owner can increase the total supply.
- **Security:** Leverages `Ownable` to protect administrative minting privileges.

### Why OpenZeppelin?
By using `ERC20.sol`, we avoid common pitfalls in manual token implementation (such as integer overflows or incorrect balance tracking) and ensure compatibility with all major crypto wallets and decentralized exchanges.