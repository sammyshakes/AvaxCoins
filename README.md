# Avax Coins

Avax Coins is a unique and innovative NFT (Non-Fungible Token) project built on the Avalanche blockchain. This project is written in Solidity and uses the Foundry toolkit for Solidity application development.

## Project Structure

This project is organized as follows:

- `.github/`: Contains GitHub workflow configurations.
- `broadcast/`: Contains Solidity contracts for Airdrop and Deploy.
- `lib/`: Contains the Forge standard library and Solmate library.
- `script/`: Contains scripts for Airdrop and Deploy.
- `src/`: Contains the AvaxCoins Solidity contracts.
- `test/`: Contains tests for the AvaxCoins contracts.

## AvaxCoins Contract

The main contract of this project is [`AvaxCoins.sol`](src/AvaxCoins.sol). It includes the `AirDrop` function for distributing tokens to multiple addresses and the `tokenURI` function for getting the URI of a specific token.

## Building and Testing

To build the project, run:

```shell
$ forge build
```

To run tests, run:

```shell
$ forge test
```

## Deploying Contracts

To deploy the contracts, run:

```shell
forge script script/Deploy.s.sol:Deploy --rpc-url fuji --broadcast --verify
```

## Verifying Contracts

To verify the contracts on Etherscan, run:

```shell
forge verify-contract <CONTRACT_ADDRESS> src/AvaxCoins.sol:AvaxCoins --verifier-url 'https://api.routescan.io/v2/network/mainnet/evm/43114/etherscan' --num-of-optimizations 200 --compiler-version v0.8.23+commit.f704f362 --watch
```

## Airdropping Tokens

To airdrop tokens, run:

```shell
forge script script/Airdrop.s.sol:Airdrop --rpc-url fuji --broadcast -vvvv
```
