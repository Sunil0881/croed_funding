// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowdFunding {
    struct Campaign {
        address owner;
        string title;
        string description;
        uint amountCollected;
        uint target;
        uint deadline;
        string image;
        address[] donators;
        uint[] donations;
    }

    mapping(uint => Campaign) public campaigns;

    uint public numberOfCampaigns = 0;

    function createCampaign(
        address _owner,
        string memory _title,
        string memory _description,
        uint _amountCollected,
        uint _target,
        uint _deadline,
        string memory _image
    ) public returns (uint) {
        Campaign storage campaign = campaigns[numberOfCampaigns];

        require(
            campaign.deadline < block.timestamp,
            "deadline should be in the future"
        );

        campaign.owner = _owner;
        campaign.title = _title;
        campaign.description = _description;
        campaign.amountCollected = _amountCollected;
        campaign.target = _target;
        campaign.deadline = _deadline;
        campaign.image = _image;

        numberOfCampaigns++;

        return (numberOfCampaigns - 1);
    }

  
}