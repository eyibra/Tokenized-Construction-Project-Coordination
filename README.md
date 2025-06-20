# Tokenized Construction Project Coordination

A comprehensive blockchain-based system for managing construction projects using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a complete solution for construction project coordination, featuring five interconnected smart contracts that handle different aspects of construction management:

1. **Project Coordinator Verification** - Validates and manages construction coordinators
2. **Subcontractor Management** - Handles subcontractor registration and assignments
3. **Material Scheduling** - Manages material procurement and delivery scheduling
4. **Progress Tracking** - Tracks project milestones and progress updates
5. **Quality Assurance** - Ensures construction quality through inspections

## Features

### Project Coordinator Verification
- Verify construction coordinators with license validation
- Track coordinator experience and specializations
- Monitor active and completed projects per coordinator

### Subcontractor Management
- Register subcontractors with specialty classifications
- Assign subcontractors to specific projects
- Track assignment status and payment information
- Maintain contractor ratings and performance metrics

### Material Scheduling
- Add materials with supplier and pricing information
- Schedule material deliveries for projects
- Reserve materials and track availability
- Update delivery status and manage inventory

### Progress Tracking
- Create and manage construction projects
- Define project milestones with target dates
- Record progress updates with percentage completion
- Track project status and timeline adherence

### Quality Assurance
- Certify quality inspectors with specializations
- Conduct quality inspections with scoring
- Track project quality metrics and certification status
- Maintain inspection history and compliance records

## Smart Contract Architecture

### Data Structures

Each contract uses optimized data maps to store:
- Entity registrations and verifications
- Project assignments and schedules
- Progress tracking and milestone data
- Quality metrics and inspection records

### Access Control

- Contract owners can verify coordinators and certify inspectors
- Registered entities can perform operations within their scope
- Read-only functions provide transparent data access

### Error Handling

Comprehensive error codes for:
- Unauthorized access attempts
- Invalid data submissions
- Resource not found scenarios
- Business logic violations

## Getting Started

### Prerequisites

- Stacks blockchain development environment
- Clarity smart contract deployment tools
- Node.js for testing framework

### Installation

1. Clone the repository
2. Install dependencies: \`npm install\`
3. Run tests: \`npm test\`
4. Deploy contracts to Stacks testnet/mainnet

### Usage Examples

#### Verify a Project Coordinator
\`\`\`clarity
(contract-call? .project-coordinator-verification verify-coordinator
'SP1234567890ABCDEF
"LICENSE123456"
u10
"Commercial Construction"
)
\`\`\`

#### Register a Subcontractor
\`\`\`clarity
(contract-call? .subcontractor-management register-subcontractor
'SP0987654321FEDCBA
"Electrical Work"
)
\`\`\`

#### Schedule Material Delivery
\`\`\`clarity
(contract-call? .material-scheduling schedule-material-delivery
u1
u1
u100
u1000
'SP1234567890ABCDEF
)
\`\`\`

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm test
\`\`\`

Tests cover:
- Contract deployment and initialization
- Function execution and state changes
- Error handling and edge cases
- Integration between contracts

## Security Considerations

- All contracts implement proper access control
- Input validation prevents invalid data entry
- State consistency maintained across operations
- Error handling prevents unexpected failures

## Contributing

1. Fork the repository
2. Create a feature branch
3. Implement changes with tests
4. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions and support, please open an issue in the GitHub repository.
