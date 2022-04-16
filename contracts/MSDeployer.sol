pragma ton-solidity >=0.58.1;
pragma AbiHeader time;
pragma AbiHeader pubkey;

import "./Constants.sol";
import "./utils.sol";
import "./MS.sol";

contract MSDeployer is Utils {
	TvmCell static MSCode;
	address static root;
	uint32 static salt;

	constructor(uint8 parralel_request_per_ms_group) public {
		require(msg.sender == root);
		uint32[] salts = getSalts();

		for (uint8 i = 0; i < salts.length; i++) {
			new MS{
				value: address(this).balance / 3 - 0.05 ever,
				code: _buildDataCode(salts[i]),
				bounce: true,
				varInit: {}
			}(
				_getAddressForSalt(salts[(i + 1) % 3]),
				_getAddressForSalt(salts[(i + 2) % 3]),
				root,
				salts[i],
				parralel_request_per_ms_group,
				i
			);
		}
		root.transfer(0, false, 128 + 32);
	}

	function getSalts() private view returns (uint32[]) {
		mapping(uint8 => uint32) shardToSalts;
		uint32[] salts;

		rnd.shuffle();
		while (salts.length < 3) {
			uint32 _salt = rnd.next(4294967295); //salt must be unique

			uint8 shardNumber = getShardNumber(_getAddressForSalt(_salt).value);
			if (shardToSalts.add(shardNumber, _salt)) {
				salts.push(_salt);
			}
		}

		return salts;
	}

	function _getAddressForSalt(uint32 _salt) internal view returns (address) {
		TvmCell _data = tvm.buildDataInit();
		TvmCell saltedCode = _buildDataCode(_salt);
		uint256 _addr = tvm.stateInitHash(
			tvm.hash(saltedCode),
			tvm.hash(_data),
			saltedCode.depth(),
			_data.depth()
		);
		return address(_addr);
	}

	function _buildDataCode(uint32 _salt) internal view returns (TvmCell) {
		TvmBuilder saltBuilder;
		saltBuilder.store(_salt);
		return tvm.setCodeSalt(MSCode, saltBuilder.toCell());
	}
}
