// SPDX-License-Identifier: MIT
pragma solidity 0.8.11;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Avrk is Ownable, ERC20Burnable {
    // Initial supply 500 000 000
    uint256 private constant MAX_SUPPLY = 5e8 ether;
    bool private initialClaimed;

    constructor() ERC20("Avarik", "AVRK") {
        _mint(address(this), MAX_SUPPLY);
    }

    function claimTokens() external onlyOwner {
        require(!initialClaimed, "AVRK: Has claimed");
        initialClaimed = true;
        _transfer(address(this), _msgSender(), MAX_SUPPLY);
    }
}
