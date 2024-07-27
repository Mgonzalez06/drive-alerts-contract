// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract TrafficData {
    struct Location {
        int256 lat;
        int256 lng;
    }

    struct Report {
        address reporter;
        Location location;
        string description;
        uint256 timestamp;
        uint256 upvotes;
        uint256 downvotes;
    }

    Report[] public reports;
    mapping(address => int256) public points;
    mapping(address => mapping(uint256 => bool)) public votes;

    function addReport(
        int256 _lat,
        int256 _lng,
        string memory _description
    ) public {
        reports.push(
            Report({
                reporter: msg.sender,
                location: Location({lat: _lat, lng: _lng}),
                description: _description,
                timestamp: block.timestamp,
                upvotes: 0,
                downvotes: 0
            })
        );
    }

    function getReports() public view returns (Report[] memory) {
        return reports;
    }

    function upvoteReport(uint256 _reportIndex) public {
        require(_reportIndex < reports.length, "Invalid report index");
        require(
            !votes[msg.sender][_reportIndex],
            "You have already voted on this report"
        );

        votes[msg.sender][_reportIndex] = true;
        reports[_reportIndex].upvotes += 1;
        points[reports[_reportIndex].reporter] += 1;
    }

    function downvoteReport(uint256 _reportIndex) public {
        require(_reportIndex < reports.length, "Invalid report index");
        require(
            !votes[msg.sender][_reportIndex],
            "You have already voted on this report"
        );

        votes[msg.sender][_reportIndex] = true;
        reports[_reportIndex].downvotes += 1;
        points[reports[_reportIndex].reporter] -= 1;
    }
}
