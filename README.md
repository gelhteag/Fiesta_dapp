Full disclamer:
This project code purpose is to explore the technology, and it is the opposite of a boilerplate.
It has a purely educational purpose for myself and for anyone reckless enough to venture out.
Having said this, welcome.


![image output](https://i.imgur.com/X5mSSIo.jpg) 



# FIESTA: NFT & FT

**FIESTA: NFT & FT** is a decentralized application (dApp) that leverages blockchain technology to provide a fun and practical platform for learning coding and software development within the blockchain ecosystem. By integrating Non-Fungible Tokens (NFTs) and Fungible Tokens (FTs), FIESTA offers an engaging way to understand smart contracts, decentralized marketplaces, and blockchain interactions through the context of festival ticketing.

---

## 🌟 Project Overview

FIESTA: NFT & FT aims to utilize blockchain technology in a practical and enjoyable manner to educate users about coding and software development within the blockchain ecosystem. By using Ganache from Truffle Suite, the project deploys a private Ethereum network, allowing for the compilation, deployment, and testing of smart contracts in a secure environment before moving to production.

### 📌 Key Features

- **NFT-Based Tickets**: Create and manage up to 1,000 unique festival tickets represented as NFTs.
- **Fungible Currency Token**: Utilize a native FT for seamless transactions within the ecosystem.
- **Fixed Pricing**: Organizers can sell tickets at a fixed price using the native currency token.
- **Marketplace**:
  - **Resale Cap**: Tickets can be resold or bought back by individuals with the resale price capped at 110% of the previous sale to ensure fair pricing.
  - **Monetization**: Organizers earn a commission from secondary market sales.
- **User-Friendly Web App**:
  - Real-time display of ticket supply, account holdings, and currency balances.
  - Interactive buttons to perform actions like purchasing and reselling tickets.

---

## 🛠️ Technologies Used

### **Architecture dApp**

- **Frontend**: Webpack, Node.js, MetaMask
- **Backend**: Ethereum Blockchain (Testnet Rinkeby)

### **Modules**

- **Truffle**: v5.1.54
- **Node.js**: v11.15.0
- **npm**: v6.7.0
- **OpenZeppelin**: v6.7.0
- **truffle-hdwallet-provider**
- **web3**: v6.7.0
- **CopyWebpackPlugin**: v6.7.0
## Getting Started

### Prerequisites
### Install Docker & Docker-Compose 
Please follow the instructions provided by: 
- [Docker](https://www.docker.com/get-started)
- [Docker-Compose](https://docs.docker.com/compose/install/)
### Install Metamsk extension on chrome or in your favorite browser
Please follow the instructions provided by  [Metamask](https://metamask.io/download.html)
Then create a wallet, in order to interact with the dapp.
### Download the project 
Clone the  provide repo or download the zip
```
$ git clone https://github.com/gelhteag/Fiesta_dapp.git
```
### spin up the dapp
```
$ cd Fiesta_dapp 
$ sudo docker-compose build
$ sudo docker-compose up
```
### Now the fun begins
When the containers are running , you can open your browser and go to //0.0.0.0:3000 or click on the link [dapp](//0.0.0.0:3000)
I deployed the contracts on the testnet Rinkeby so you can already used the dapp.

#### Tickets: ERC721 the nonfungible token 
- ERC-721 Token Name: FiestaNFT
- ERC-721 Token Symbol: FSTN
- ERC-721 contract: 0x6CB93660757f7158995f132C5066E8C8dBced7d7
#### Coins: ERC20 the fungible token
- ERC-20 Token Name: Fiesta
- ERC-20 Token Symbol: FST
- ERC-20 contract: 0xC9f1272CcAFbe5B317bb5857aA7CAf807f03370c
#### Market: Smart contract enabling the buy and sell of the FSTN and the FST 
- Contract: 0x7921204C49C2C47bb9f9A0f6a6E1Cbb367cE65Fb

**All these 3 contracts can be found on**  [etherscan](https://rinkeby.etherscan.io/)

### Interact with the dapp
In order to use the dapp and to be able to buy and sell FSTN tickets with FST coins, few steps need to be followed.

#### Step 1: Get  testnet Ethereum
To do so , you use the link below and follow the instructions
- https://faucet.rinkeby.io/
#### Step 2: Go to  //0.0.0.0:3000 or click on the link [dapp](//0.0.0.0:3000)
#### Step 3: In the Market section 
Click on the **Buy FST** button  and put the amount of  FST that you want purchase, for exemple 1 then click pay you will get 1000 FST (1 ETH : 1000 FST).



![image output](https://i.imgur.com/rHWCfHG.png)


A pop-up will appear in order to sign the transaction with your metamask wallet, click confirmed.



![image output](https://i.imgur.com/DV7JoxN.png)



When the transaction is done you can go to your wallet and
- click on add new token 
- click on custom token then past the contract: 0xC9f1272CcAFbe5B317bb5857aA7CAf807f03370c
- click add

You will see the amount of FST purchased in your wallet !!!
Great, now you are able to buy tickets festival (FSTN).
You can also put it for sale using the **Sale ticket** button.
When  tickets are put on secondary market  "Ticket for sale", someone can click on the button **Get tickets for sale** in order to have a list of all the tickets available on the secondary Market, and at wich price.




![image output](https://i.imgur.com/cGa5BVe.png)




Note that the button Information gives the following information :
- Total supply of tickets that will never be created
- Number of ticket owned by individuals but not offered for sale
- Number of ticket offered for sale by private individuals
- Tickets available on the market (from the organiser and individuals)



![image output](https://i.imgur.com/58ZzCly.png)




So lastly, if someone wants to buy a ticket on the secondary market 
he must first see if tickets are on sale and if so he must give the price and the id of the desired ticket.

So now,the loop is complete !!!
Finaly , take in mind that it is just an easy exemple and a funny way to create a dapp on the ethereum network.

