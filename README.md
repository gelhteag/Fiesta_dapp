# Fiesta_dapp
Full disclamer:
This project code was to explored the technology and it is the opposite of a boilerplate.
It has a purely educational purpose for myself and for anyone reckless enough to venture out.
This so extended says welcome

# FIESTA : NFT & FT 

This project aims to used the blockchain technology in a practical case as fun way to learn code and software around this ecosystem.
For this purpose, I used ganache from [trufflesuite](https://www.trufflesuite.com/ganache) easy to used and install. It give the possibility to deployed a private ethereum network in order to compile, deployed and test smart-contract before production in a safe environement.
###### The developpement and the test were done on a  Ubuntu 20.04.1 LTS -v focal.
### Case : 
1.	Create a non-fungible token that represents tickets for a festival and a fungible currency token using Solidity. 
o	Create a supply of maximum 1000 tickets
o	Tickets can be buy  from the organizer at a fixed price in the currency token.
o	Create a Market place where ticket can be resold or buy back by individuals, but the price can never be higher than 110% of the previous sale
o	Add a monetization option for the organizer in the secondary market sales
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
### Install Metamsk extension on chrome or in to your favorite browser
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
### Now the fun begin
When the containers are runing , you can open your browser and go to //0.0.0.0:3000 or click on the link [dapp](//0.0.0.0:3000)
I did deployed the contracts on the testnet Rinkeby so you can already used the dapp.

#### Tickets: ERC721 the nonfungible token 
- ERC-721 Token Name : FiestaNFT
- ERC-721 Token Symbol : FSTN
- ERC-721 contract : 
#### Coins: ERC20 the fungible token
- ERC-20 Token Name : Fiesta
- ERC-20 Token Symbol : FST
- ERC-20 contract : 
#### Market: Smart contract enabling the buy and sell of the FSTN and the FST 
- Contract : 
### Interact with the dapp
In order to used the dapp and to be able to buy and sell FSTN tickets with FST coins, few step need to be followed.

#### Step 1: Get  testnet Ethereum
To do so , you used the link below and follow the instructions
- https://faucet.rinkeby.io/
#### Step 2: Go to  //0.0.0.0:3000 or click on the link [dapp](//0.0.0.0:3000)
#### Step 3: In the Market section 
Click on the **Buy FST** button  and put the amount of  FST that you want purchase, for exemple 1 then click pay you will get 100 FST (1 ETH : 100 FST).
A pop-up will appear in order to sign the transaction with your metamask wallet, click confirmed.
When the transaction is done you can go to your wallet and
- click on add new token 
- click on custom token then past the contract :
- click add

You will see the amount of FST purchase on your wallet !!!
Great then now you are able to buy tickets festival (FSTN).
You can also put it for sell using the **Sale ticket** button.
When  tickets are put on secondary market  "Ticket for sale" someone can click on the button **Get tickets for sale** in order to have a list of all the tickets available on the secondary Market, and at wich price.
Not that the button Information gives the following information :
- Total supply of ticket that will never be creat
- Number of ticket owned by individuals but not offered for sale
- Number of ticket offered for sale by private individuals
- Ticket available on the market (from the organiser and individuals)

So lastly, if someone want to buy a ticket on the secondary market 
he must first see if tickets are on sale and if so he must give the price and the id of the desired ticket.

And that set,the loop is complet !!!
Finaly , take in mind that it is just an easy exemple and a funy way to create a dapp on the ethereum network.

## Improvement clue:
All can be improve of course, this project was to explored the technology and are the opposite of a boilerplate code.
At docker-compose level, the possibility of being able to migrate new version of contracts from the containers is missing.

- One solution coud be to create 3 containers, one containing the dapp, one containing an image of ganache-cli and one containing the contracts.
The goal would be to be able to have access without installation worries to a contairiser development station giving the possibility to test the contracts inside the ganache privat network container to finally be able to deploy the contract terminating on the mainnet / testnet. Without having to make a local installation. And spin all in one command.


At the  contracts level, an improvement of the implementation, or a more in-depth test must be done in order to take into account the gas consumption that may cause by certain redundancy or poor implementation. In addition, "potential" flaws,can lead to unespected behavior of contracts with catastrophic surprises in production. And the modifications / repairs at this stage become perilous !
