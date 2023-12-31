# Avax Coins

Avax Coins is a unique and innovative NFT (Non-Fungible Token) project built on the Ethereum blockchain. This project is written in Solidity and uses the Foundry toolkit for Ethereum application development.

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
