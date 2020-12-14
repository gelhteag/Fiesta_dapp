
const FiestaERC721 = artifacts.require("FiestaERC721");
const FiestaERC20 = artifacts.require("FiestaERC20");
const Market = artifacts.require("Market");

module.exports = async function(deployer) {
    let _ = new Array(2);
    let contracts = await deployer.deploy(FiestaERC721).then(async x=> {
    	    _.push(x);
    	    await deployer.deploy(FiestaERC20).then(async y=> {
    	    _.push(y);
    	   });
    });    
    console.log("-------------------------------------------------------------------------------------------------ERC721");
    console.log(_[2].address);
    console.log("-------------------------------------------------------------------------------------------------ERC20");
    console.log(_[3].address);
    
    await deployer.deploy(Market,_[3].address,_[2].address);
};
