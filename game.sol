// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

//importing the required repositories
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract degenGames is ERC20("Degen", "DGN"), Ownable(msg.sender) {
    
    //structure for designing the items
    struct Items{
        string name;
        uint256 tokenPoints; // it is basically the items that questioned mention to redeem tokens 
        string redeemable;
    }

    mapping(address => mapping(uint256 => uint256)) holderCount;
    mapping(uint256 => Items) TokenMark;

    //the constructor will make and add some items to the game which can be used for redeeming the tokens 
    //only those items could be redeemed which has the redeemable value "Yes"
    constructor() {
        TokenMark[1] = Items("Reyna", 20000 , "No");
        TokenMark[2] = Items("Sage", 10000 , "Yes");
        TokenMark[3] = Items("Omen", 5000 , "Yes");
        TokenMark[4] = Items("Skye", 40000 , "Yes");
        TokenMark[5] = Items("Chamber", 1000 , "No");
    }

    //function to add Tokens to the account
    function addToken(address adr, uint256 amount) public onlyOwner returns(string memory){
        _mint(adr, amount);
        return "Amount added. ThankYou!";
    }

    //function for Destroying some Tokens from the account
    function destroyToken(uint256 amount) public onlyOwner {
        if(balanceOf(msg.sender)<amount){
            revert("Sorry ! You do not have enough Tokens to BURN");
        }
        else {
            _burn(msg.sender,amount);
        }
    }

    //Function to check the number of tokens in the account
    function checkBalance() view public returns(uint256){
        return balanceOf(msg.sender);
    }

    //function for transferring the tokens from one accouynt to another and only the owner can transfer that amount 
    function transferToken(address ad, uint256 amount) public onlyOwner {

        require (balanceOf(msg.sender)>=amount, "Not Enough Tokens , Sorry!!");
        approve(msg.sender, amount); 
        transferFrom(msg.sender, ad, amount);
    }

    //function for adding redeem items to the account
    function addItems(uint256 itemNumber, uint256 amount) public onlyOwner returns(string memory){
        holderCount[msg.sender][itemNumber] +=amount;
        return "Item successfully added to your ID. ";
    }

    //function for showing the rules and details of the game 
    function Show_Details() pure public returns(string memory){
        return "There are total 5 Items in the store which are :- Reyna (20000, Not Redeemable) , Sage (10000, Redeemable) ,Omen (5000, Redeemable) ,Skye (40000, Redeemable) ,Chamber (1000, Not Redeemable) . Price for one token is 40,000 and only one item can be used at a time for redeemal ";
    }

    //final function to redeem the Items on the basis of Tokens
    function redeemer(uint256 redItemNum, uint256 tokenNum) public onlyOwner returns (string memory) {
        require(keccak256(abi.encodePacked(TokenMark[redItemNum].redeemable))==keccak256(abi.encodePacked("Yes")) , "This is not exchangable");
        require(balanceOf(msg.sender)>=tokenNum , "Insufficient tokens X ");

        holderCount[msg.sender][redItemNum] += ((40000*tokenNum)/TokenMark[redItemNum].tokenPoints);
        _burn(msg.sender, tokenNum);
        return "Items redeemed Successfully !!";
    }

    //function to show details of every item
    function det(uint256 itemNum) view public returns(uint256) {
        return holderCount[msg.sender][itemNum];
    }
}
