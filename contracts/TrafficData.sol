// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract TrafficData {
    struct Report {
        address reporter;
        string location;
        string description;
        uint256 timestamp;
    }

    Report[] public reports;

    function addReport(
        string memory location,
        string memory description
    ) public {
        reports.push(
            Report({
                reporter: msg.sender,
                location: location,
                description: description,
                timestamp: block.timestamp
            })
        );
    }

    function getReports() public view returns (Report[] memory) {
        return reports;
    }
}
