pragma ton-solidity >=0.58.1;
import "./Constants.sol";

struct MSSettings {
	address next;
	address prev;
	address trinity_root;
	uint32 salt;
	uint8 position;
	uint8 total_threads;
}

contract MS {
	MSSettings public settings;

	constructor(
		address _MSaddressesNext,
		address _MSaddressesPrev,
		address _root,
		uint32 _salt,
		uint8 _parralel_request_count,
		uint8 _position
	) public {
		tvm.accept();
		settings.next = _MSaddressesNext;
		settings.prev = _MSaddressesPrev;
		settings.trinity_root = _root;
		settings.salt = _salt;
		settings.position = _position;
		settings.total_threads =
			_parralel_request_count *
			Constants.ms_group_members_count;
		for (uint8 i = 0; i < _parralel_request_count; i++) {
			MS(_MSaddressesNext).mode1(1);
		}
	}

	function mode1(uint16 counter) public view {
		require(msg.sender == settings.prev);
		if (counter >= 100) {
			//TODO send log to trinity.
			counter = 0;
		}

		//Logic about clearing state
		if (settings.position == 0 && address(this).balance < 0.1 ever) {
			// if we are have position 0 - main MS in the group and have < 0.08 on balance, stop iterating.
			// wait until we got all mesages;
			MS(address(this)).count_destroy();
		} else {
			MS(settings.next).mode1{bounce: false}(counter + 1);
		}
	}

	function count_destroy() public {
		require(msg.sender == address(this));
		tvm.accept();
		settings.total_threads = settings.total_threads - 1;
		if (settings.total_threads == 0) {
			MS(settings.next).destroy_sender();
			MS(settings.prev).destroy_sender();
			selfdestruct(settings.trinity_root);
		}
	}

	function destroy_sender() public {
		require(
			msg.sender == settings.prev ||
				msg.sender == settings.next ||
				msg.sender == address(this)
		);
		tvm.accept();
		selfdestruct(settings.trinity_root);
	}
}
