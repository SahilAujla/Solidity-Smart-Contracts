// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract BlindAuction {
    
    // VARIABLES
    struct Bid {
        bytes32 blindedBid;
        uint deposit;
    }

    address payable public beneficiary;
    uint public biddingEnd;
    uint public revealEnd;
    bool public ended;

    mapping(address => Bid[]) public bids;

    address public highestBidder;
    uint public highestBid;

    mapping(address => uint) pendingReturns;

    // EVENT
    event AuctionEnded(address winner, uint highestBid);

    // MODIFIERS

    // FUNCTIONS

    constructor() {

    }    

    function generateBlindedBidBytes32() {

    }

    function bid() {

    }

    function reveal() {

    }

    function auctionEnd() {

    }

    function withdraw() {

    }

    function placeBid() {

    }
}
