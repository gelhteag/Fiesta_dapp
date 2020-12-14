import Web3 from "web3";
import FiestaERC721Artifact from "../../build/contracts/FiestaERC721.json";
import FiestaERC20Artifact from "../../build/contracts/FiestaERC20.json";
import MarketArtifact from "../../build/contracts/Market.json";


const App = {
  web3: null,
  account: null,
  meta: null,
  meta20:null,
  meta721:null,
  

  start: async function() {
    const { web3 } = this;
    
    try {
      // get Market contract instance
      const networkId = await web3.eth.net.getId();
      const deployedNetwork = MarketArtifact.networks[networkId];
      this.meta = new web3.eth.Contract(
        MarketArtifact.abi,
        deployedNetwork.address,
      
      );
      // get accounts  Market
      const accounts = await web3.eth.getAccounts();
      
      this.account = accounts[0];
      this.accountContract = this.meta.options.address;
      
      // get ERC20 contract instance
      const networkId20 = await web3.eth.net.getId();
      const deployedNetwork20 = FiestaERC20Artifact.networks[networkId20];
      this.meta20 = new web3.eth.Contract(
        FiestaERC20Artifact.abi,
        deployedNetwork20.address,
      
      );
      // get accounts  ERC20
      const accounts20 = await web3.eth.getAccounts();
      
      this.account20 = accounts20[0];
      
       // get ERC721 contract instance
      const networkId721 = await web3.eth.net.getId();
      const deployedNetwork721 = FiestaERC721Artifact.networks[networkId721];
      this.meta721 = new web3.eth.Contract(
        FiestaERC721Artifact.abi,
        deployedNetwork721.address,
      
      );
      // get accounts  ERC721
      const accounts721 = await web3.eth.getAccounts();
      
      this.account721 = accounts721[0];
     
     
    } catch (error) {
      console.error("Could not connect to contract or chain.");
    }
  },
   
  

  setStatus: function(message) {
    const status = document.getElementById("status");
    status.innerHTML = message;
  },
  setBalance: function(message) {
    const setBalance = document.getElementById("setBalance");
    setBalance.innerHTML = message;
  },
  setBuyInfo: function(message) {
    const setBuyInfo = document.getElementById("setBuyInfo");
    setBuyInfo.innerHTML = message;
  },
  buyCoin: async function() {
    const { buyCoin } = this.meta.methods;
    const amount = document.getElementById("amount").value;    
    //await incAllow(this.meta.options.address,bigPrice.toString()).send({from: this.account20});
    await buyCoin(amount).send({from: this.account , value:web3.toWei(amount,'ether')});
    App.setStatus(`New Ticket Owner is ${this.account}.`);
  },
  buyTicket: async function() {
    const { buyTicket } = this.meta.methods;
    const { incAllow } = this.meta20.methods;
    const bigPrice = 100 *10 ** 18;
    await incAllow(this.meta.options.address,bigPrice.toString()).send({from: this.account20});
    await buyTicket(bigPrice.toString()).send({from: this.account});
    App.setBuyInfo(`New Ticket Owner is ${this.account}`);
  },
  
  openTrade: async function() {
    const { openTrade } = this.meta.methods;
    const { incAllow } = this.meta20.methods;
    const { approve } = this.meta721.methods;
    const idT = document.getElementById("idT").value;
    const tradePrice = document.getElementById("tradePrice").value;
    const bigPriceT = tradePrice *10 ** 18;
    await approve(this.meta.options.address,idT).send({from: this.account721}); // in order to avoid the error : caller is not owner nor approve
    await openTrade(idT,bigPriceT.toString()).send({from: this.account});
    //await incAllow(this.account,bigPriceT.toString()).send({from: this.account20});
    
    App.setStatus(`New Ticket Owner is ${this.account}.`);
  },
  getTicketForSale: async function() {
    const { getTicketForSale } = this.meta.methods;
    const getTicketForSales = await getTicketForSale().call();
    //console.log(`Info Market: -Price ${getTicketForSales[1][1]}  - Id TicketForSale: ${getTicketForSales[0]} `);
    var loop = [];
    for(var i=0; i<1000; i++){
        if(getTicketForSales[0][i]>0){
            
            loop.push({Price: getTicketForSales[1][i]/(10**18) , IdTicket: getTicketForSales[0][i]});
            
        }
    }
    App.setBalance(JSON.stringify(loop));
    console.log(JSON.stringify(loop))    
  },
  
  getTrade: async function() {
    const { getTrade } = this.meta.methods;
    const idTrade = document.getElementById("idTrade").value;
    const tradeOpen = await getTrade(idTrade).call();
    
  
    App.setStatus(`Ticket for sale: price:${tradeOpen[2]}  idTrade:${tradeOpen[1]} sender:${tradeOpen[0]} status:${tradeOpen[4]}`);
    
  },
  getInfo: async function() {
    const { getInfo } = this.meta.methods;
    const getInfos = await getInfo().call();
    
    App.setStatus(`Info Market: -TicketSupply: ${getInfos[0]}  -TicketForSales: ${getInfos[1]} -TicketNotForSales :${getInfos[2]} -TicketAvailable :${getInfos[3]}`);
    
  },
  getBalance: async function() {
    const { balanceW } = this.meta20.methods;
    const getBalances = await balanceW(this.account).call();
    
    App.setBalance(`Balance: ${getBalances[0]*1000} FST `);
    
  },
  
  executeTrade: async function() {
    const { executeTrade } = this.meta.methods;
    const { getTrade } = this.meta.methods;
    const { incAllow } = this.meta20.methods;
    const tradePrices = document.getElementById("tradePriceEx").value;
    const idTicket = document.getElementById("idTicket").value;
    const ticket = await getTrade(idTicket).call();
    const tradePriceT = tradePrices * 10 ** 18;
    await incAllow(this.account,tradePriceT.toString()).send({from: this.account20});
    await incAllow(this.meta.options.address,tradePriceT.toString()).send({from: this.account20});
    await executeTrade(ticket[1]).send({from: this.account});
    App.setStatus(`New Ticket Owner is ${this.account}.`);
  }

};

window.App = App;

window.addEventListener("load", async function() {
  if (window.ethereum) {
    // use MetaMask's provider
    App.web3 = new Web3(window.ethereum);
    await window.ethereum.enable(); // get permission to access accounts
  } else {
    console.warn("No web3 detected. Falling back to http://127.0.0.1:7545. You should remove this fallback when you deploy live",);
    // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
    App.web3 = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:7545"),);
  }

  App.start();
});
