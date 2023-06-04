// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.9.0;


contract Whitelist{

    // max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // if an address is whitelisted, we would set it to true
    mapping(address => bool) public whitelistedAddresses;

    // number of whitelisted addresses
    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses){
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }


    // add the address of the sender to the whitelist
    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }

}

