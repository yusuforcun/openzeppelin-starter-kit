## Project 1: Admin Panel (Access Control)

This project demonstrates how to securely manage administrative rights in a smart contract using industry-standard patterns.

### Objective
To implement secure access control and ensure that critical system functions can only be triggered by an authorized administrator (owner).

### Technical Stack
- **Solidity:** ^0.8.20
- **Library:** OpenZeppelin Contracts (`Ownable.sol`)
- **Framework:** Foundry

### Core Features
- **Ownable:** Inherits OpenZeppelin's battle-tested `Ownable` contract to handle ownership logic.
- **Modifier (onlyOwner):** Restricts critical function access to the contract owner only.
- **Security:** Unauthorized access attempts are automatically rejected, ensuring system integrity.

### Test Coverage
- `test_OnlyOwnerCanSetStatus`: Validates that non-owner addresses are restricted from executing privileged functions.
- `test_OwnerCanSetStatus`: Confirms that the owner can successfully update system states.

### Execution
```bash
# Run tests with logs
forge test -vv