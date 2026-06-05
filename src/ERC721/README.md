# Project 4: Deep-Dive ERC721 (Advanced Hooks)

This project explores the internal mechanics of the OpenZeppelin ERC721 implementation by overriding the `_update` hook.

### Deep-Dive Analysis
- **Internal Hook (`_update`):** Instead of just calling `_mint`, we override the `_update` function. This function is the "engine" of all state changes in ERC721 (minting, transferring, burning).
- **The Logic:** By calling `super._update(...)`, we preserve all battle-tested security checks (balance updates, approval clearing) while adding custom logic before or after the state change.
- **`address(0)` Significance:** Identifying minting (from `address(0)`) vs. burning (to `address(0)`) vs. transferring events within the `_update` loop.

### Technical Stack
- **Solidity:** ^0.8.20
- **Library:** OpenZeppelin `ERC721.sol`
- **Hook Pattern:** Override pattern for `_update`.

### Test Coverage
- `test_MintAndOwn`: Verifies correct state assignment during minting.
- `test_ApprovalSystem`: Ensures that custom hook logic does not interfere with the standard approval/transfer security flows.