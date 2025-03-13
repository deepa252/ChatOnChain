
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract BlockchainChat {
    struct Message {
        address sender;
        string content;
        uint256 timestamp;
    }

    Message[] public messages;
    event NewMessage(address indexed sender, string content, uint256 timestamp);

    // Function to send a message
    function sendMessage(string memory _content) public {
        require(bytes(_content).length > 0, "Message cannot be empty");
        messages.push(Message(msg.sender, _content, block.timestamp));
        emit NewMessage(msg.sender, _content, block.timestamp);
    }

    // Function to get all messages
    function getMessages() public view returns (Message[] memory) {
        return messages;
    }
}
