# 🏁 Message Sender

---

## Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Structure](#structure)
- [Acknowledgements](#acknowledgements)
- [Backlog](#backlog)

## About <a name = "about"></a>

This project is the set of smart contracts for the testing speed of the Everscale blockchain.

## Getting Started <a name = "getting_started"></a>

### Prerequisites

You will need:

- [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/) are installed on your machine.

- Some amount of tokens to interact with the smart contracts.

If you're using VS Code, you can install the [Everscale Solidity extension](https://marketplace.visualstudio.com/items?itemName=everscale.solidity-support) for convenient access to the Everscale Solidity language.

### Installing

- Configure the network (endpoint), tps and duration in [config.json](config.json) You can choose `https://main.ton.dev` ([mainnet](https://ever.live/landing)) or `https://net.ton.dev` ([testnet](https://net.ever.live/))
- Install modules

 ```bash
 npm install
 ```

- Deploy giver

 ```bash
 npm run giver
 ```

In this step you will generate the keys `GiverV2.keys.json` file and deploy Giver. Follow the instructions in command line.

- Finally, start to generate transactions in the blockchain

```bash
npm run start
```

## Contracts system <a name="structure"></a>

The system consists of the root smart contract and several child smart contracts.
The root smart contract ([TrinityRoot.sol](contracts/TrinityRoot.sol)) is the main smart contract that recursively deploys the child smart contracts-deployers ([MSDeployer.sol](contracts/MSDeployer.sol)). The quantity of these contracts depends on the tps number that we need.
Each contract-deployer deploys three child smart contracts-senders ([MS.sol](contracts/MS.sol)) that will send transactions to each other in a loop. When the tokens were expensed on the gas fee contracts-senders will be destroyed and the remaining balance will be sent to the root smart contract.

## Acknowledgements <a name="acknowledgements"></a>

This project is related to the [MessageSender (MS)](https://github.com/EverscaleGuild/bounties/issues/14) bounties program.

## Backlog <a name = "backlog"></a>

- Collecting the data from the blockchain that will show speed for example in a real-time chart or etc.
