Full disclamer:
This project code purpose is to explore the technology, and it is the opposite of a boilerplate.
It has a purely educational purpose for myself and for anyone reckless enough to venture out.
Having said this, welcome.


![image output](https://i.imgur.com/X5mSSIo.jpg) 


# FIESTA : NFT & FT 

This project aims to use the blockchain technology in a practical case as fun way to learn code and software around this ecosystem.
For this purpose, I used ganache from [trufflesuite](https://www.trufflesuite.com/ganache) easy to used and install. It gives the possibility to deploy a private ethereum network in order to compile, deploy and test smart-contract before production in a safe environement.
###### The developpement and the test were done on a  Ubuntu 20.04.1 LTS -v focal.
### Case : 
1.	Create a non-fungible token that represents tickets for a festival and a fungible currency token using Solidity. 
-	Create a supply of maximum 1000 tickets
-	Tickets can be bought from the organizer at a fixed price in the currency token.
-	Create a Market place where tickets can be resold or bought back by individuals, but the price can never be higher than 110% of the previous sale
-	Add a monetization option for the organizer in the secondary market sales
2.	Create a small web app to show the current state (supply, what the accounts own, balances) and buttons to demonstrate the different functions.

## Architecture dapp:
 - Frontend: Webpack
 - Backend: NodeJS

## Module used:
 - Truffle v5.1.54
 - node v11.15.0
 - npm v6.7.0
 - OpenZeppelin v6.7.0
 - truffle-hdwallet-provider
 - web3 v6.7.0
 - CopyWebpackPlugin v6.7.0
 

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
Clone the  provide [repository](https://github.com/gelhteag/Computer-Pointer-Controller)

### spin up the dapp
```sh
$ cd path of the directory of the project
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
Click on the **Buy FST** button  and put the amount of  FST that you want purchase, for exemple 1 then click pay you will get 100 FST (1 ETH : 100 FST).



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

## Improvement clue:
Everything can be improved of course, this project was meant to explored the technology and is the opposite of a boilerplate code.
At docker-compose level, the possibility of being able to migrate new version of contracts from the containers is missing.

- One solution coud be to create 3 containers, one containing the dapp, one containing an image of ganache-cli and one containing the contracts.
The goal would be to be able to have access without installation worries to a contairiser development station giving the possibility to test the contracts inside the ganache privat network container to finally be able to deploy the contract terminating on the mainnet / testnet. Without having to make a local installation. And spin all in one command.


At the  contracts level, an improvement of the implementation, or a more in-depth test must be done in order to take into account the gas consumption that may caused by certain redundancy or poor implementation. In addition, "potential" flaws can lead to unespected behavior of contracts with catastrophic surprises in production. And the modifications / repairs at this stage become perilous !
