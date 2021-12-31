# smart-contracts-dev

Learned from: https://github.com/smartcontractkit/full-blockchain-solidity-course-py

## What is Solidity?
Solidity is an object-oriented, high-level language for implementing smart contracts. Smart contracts are programs which govern the behavior of accounts within the Ethereum state.

## Compile a smart contract with Python.

1.create a virtual environment and activate with 

```bash
python -m venv venv
source venv/bin/activate
```

2.Install py-solc-x

**py-solc-x** : Python wrapper and version management tool for the *solc* Solidity compiler.

**solc** is a solidity compiler.

```bash
pip install py-solc-x
```
Code example of compiling the 'MyContract' contract: 

```python
from solcx import compile_standard, install_solc

with open("./MyContract.sol", "r") as file:
    simple_storage_file = file.read()

install_solc("0.6.0") #Download and install a precompiled solc binary.

compiled_sol = compile_standard(
    {
        "language": "Solidity",
        "sources": {"MyContract.sol": {"content": simple_storage_file}},
        "settings": {
            "outputSelection": {
                "*": {
                    "*": ["abi", "metadata", "evm.bytecode", "evm.bytecode.sourceMap"]
                }
            }
        },
    },
    solc_version="0.6.0",
) # Compile Solidity contracts using the JSON-input-output interface.

# Dump the complied code in a json file.
with open("compiled_code.json", "w") as file:
    json.dump(compiled_sol, file)
```
## Deploy the 'MyContract' contract with web3.py

When you want to deploy a contract to the blockchain, you need a running node of the blockchain.
For testing there is **ganache-cli** :

*Ganache CLI is the latest version of TestRPC: a fast and customizable blockchain emulator. It allows you to make calls to the blockchain without the overheads of running an actual Ethereum node.*

First install web3 and ganache-cli by pip python package manager and yarn node package manager:

```bash
pip install web3
sudo yarn global add ganache-cli
ganache-cli -d
```

and then run the script *deploy.py*:

```bash
python deploy.py
```

### Solidity Notes

- **msg.sender** (address): sender of the message (current call)

- **msg.value**(uint): number of wei sent with the message

- **tx.origin** (address): sender of the transaction (full call chain)

- **this** (current contract’s type): the current contract, explicitly convertible to address or address payable

- **payable** for functions: Allows them to receive Ether together with a call. so you can call `msg.value`

