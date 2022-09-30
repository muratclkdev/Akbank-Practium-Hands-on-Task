// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract DecentralizedMessenger {
    struct User {      //define a structure that holds user information
        string text;
		address receiver;
		bool completed;

    }

	User[] public messsages; // array of whole users


	function send (string calldata _text , address _receiver) public { // calling it like a function and sending message another user
		messsages.push(User(_text, _receiver, false));
	}

    
	function updateText (uint _index, string calldata _text) public { // updating previously sent message
		User storage newtext = messsages[_index];
		newtext.text = _text;

	}

	function updateReceiver (uint _index, address _receiver) public { // updating previously sent receiver
	User storage newreceiver = messsages[_index];
	newreceiver.receiver = _receiver;

	}


     //we don't need this function because we can call array
    function get(uint _index) public view returns (string memory text, 
    address receiver, 
    bool completed) {
    
        User storage getUser = messsages[_index];
        return (getUser.text, getUser.receiver, getUser.completed);
    }


	function toggleCompleted (uint _index)  public { //update completed
		User storage todo = messsages[_index];
		todo.completed = !todo.completed;
	}
}