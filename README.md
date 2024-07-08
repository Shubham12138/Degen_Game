# Degen_Game
I created this project using solidity for ERC20 token and transacted it using AVAX testnet tokens

Here is my metamask address to check the AVAX Transactions on snow trace test net = 0x7Ae07623Cf01c93f3Ac1003581D403De24B48CD2

My program is creating ERC20 Tokens and utilizing them as the project required.

1.) It has function to mint the tokens = addToken(address adr, uint256 amount), for adding the tokens.
2.) destroyToken(uint256 amount) = function for Destroying some Tokens from the account
3.) checkBalance() = Function to check the number of tokens in the account
4.) transferToken(address ad, uint256 amount) = function for transferring the tokens from one accouynt to another and only the owner can transfer that amount 
5.) addItems(uint256 itemNumber, uint256 amount) = function for adding redeem items to the account
6.) Show_Details() = function for showing the rules and details of the game 
7.) redeemer(uint256 redItemNum, uint256 tokenNum) = final function to redeem the tokens on the basis of Items
8.) det(uint256 itemNum) = function to show details of every item

One more thing , user must have items worth of itemvalue more than 40,000 to redeem a token , 40,000 points(OF any item) = 1 Token.

Lastly, I want to mention that I am unable to transact entire functioning using AVAX , since there is a lijmit of 720K or something which my program was exceeding, thats why in the video also mentioned that problem because i am only able to deploy my work using AVAX not the entire functioning using it. I also asked my mentors on Discord but no one replied on my Query.

Also, I request the mentors to review my Module 3 work, Its been pending for a week now.

Thank You.


## Mistake Solved :

### Sorry for the mistake I did. Basically i was redeeming tokens by selling the Items rather buying items by selling the tokens.
