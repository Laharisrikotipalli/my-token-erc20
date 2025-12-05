# 🌟 MyToken – ERC-20 Token Project
## 📌 Overview

MyToken is a fully functional ERC-20 token implemented in Solidity 0.8.x.
It includes all required features such as transfers, approvals, allowances, and event logging.
The contract is written using best practices, safe arithmetic, and defensive input validation.

## 📄 Token Details
Property	Value (example)
Name	My Token
Symbol	MTK
Decimals	18
Total Supply	1000 × 10¹⁸

You may update the values above based on your deployment.

## 🔎 What is an ERC-20 Token?

ERC-20 is a widely-used Ethereum token standard that defines:

How tokens are transferred

How balances are tracked

How third-party spending is approved

Events that wallets and dApps listen to

Any ERC-20 token must implement these functions:

transfer

approve

transferFrom

balanceOf

allowance

And emit these events:

Transfer

Approval

## ⚙️ Implemented Features

✔ Complete ERC-20 functionality
✔ Safe supply initialization with overflow protection
✔ Validation against zero-address transfers
✔ Event emission (Transfer, Approval)
✔ Allowance management
✔ Increase/decrease allowance
✔ Fully tested using RemixIDE

## 🚀 Deployment Instructions (RemixIDE)

Open https://remix.ethereum.org

Create a folder contracts/ and add MyToken.sol

Go to Solidity Compiler

Select version 0.8.20

Click Compile MyToken.sol

Go to Deploy & Run

Environment: Remix VM (London)

Select contract: MyToken

Enter constructor parameters:

"My Token", "MTK", 18, 1000


Click Deploy

Interact with functions:

name()

symbol()

decimals()

totalSupply()

balanceOf(address)

transfer(address,uint256)

approve(address,uint256)

transferFrom(address,address,uint256)

## 🧪 Usage Examples
✔ Check your balance
balanceOf(0xYourAddress)

✔ Transfer tokens
transfer(0xReceiver, 100)

✔ Approve spender
approve(0xSpender, 500)

✔ Delegated transfer
transferFrom(0xSender, 0xReceiver, 200)

## 🧪 Testing Scenarios & Results
1️⃣ Successful Compilation

Contract compiles with 0 errors using Solidity 0.8.x.

2️⃣ Deployment

Contract deployed successfully with a valid address.

3️⃣ Token Metadata

name(): returns "My Token"

symbol(): returns "MTK"

decimals(): 18

totalSupply(): 1000 × 10¹⁸

4️⃣ Transfer Test

Sender balance decreased

Receiver balance increased

Transfer event emitted

5️⃣ Approval + transferFrom

spender approved

transferFrom executed

allowance decreased

Approval event emitted

## 🎓 What I Learned

How ERC-20 tokens work internally

Why decimals are needed in token accounting

How allowances and delegated transfers work

Importance of zero-address validation

How to debug deployment errors like invalid opcode

Using RemixIDE to deploy and interact with smart contracts
