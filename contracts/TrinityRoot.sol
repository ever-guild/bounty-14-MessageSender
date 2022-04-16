pragma ton-solidity >=0.58.1;
pragma AbiHeader pubkey;

import "./MSDeployer.sol";
import "./Constants.sol";

library TrinityRootContractErrors {
	uint8 constant error_message_sender_is_not_my_owner = 100;
	uint8 constant error_insufficient_balance = 101;
	uint8 constant error_bad_tps_params = 102;
}

contract TrinityRoot {
	TvmCell static MSDeployerCode;
	TvmCell static MSCode;

	uint128 static salt;

	uint32 public deployer_counter;

	uint128 value_for_deployer_gas = 0.15 ever;
	uint128 value_for_recursive_trinity_call_gas = 0.05 ever;

	modifier onlyOwnerOrSelf() {
		require(
			address(this) == msg.sender || tvm.pubkey() == msg.pubkey(),
			TrinityRootContractErrors.error_message_sender_is_not_my_owner
		);
		_;
	}

	function launchTps(uint128 timeSeconds, uint32 tps) public onlyOwnerOrSelf {
		tvm.accept();

		//Now we deploy One MSDeployer and if we need more - just call this contract again recursively.
		new MSDeployer{
			value: getCostForTps(timeSeconds, 1) -
				value_for_recursive_trinity_call_gas,
			flag: 1,
			code: MSDeployerCode,
			bounce: false,
			varInit: {
				MSCode: MSCode,
				root: address(this),
				salt: deployer_counter
			}
		}(Constants.parralel_request_per_ms_group);
		// When we send a message from shard A to shard B they will not added in next block, it can be B + 1, B + 2, B + 3.
		// So we used Constants.parallel_request_per_ms_group (parallels request) to compensate this delay and keep TPS.

		deployer_counter++;
		if (tps > 1) {
			TrinityRoot(address(this)).launchTps(timeSeconds, tps - 1);
		}
	}

	function getCostForTps(uint128 timeSeconds, uint32 tps)
		public
		view
		returns (uint128)
	{
		// 5_000_000 - cost for send one message from ms
		// 3 - ms's in one group
		uint128 cost_per_tps_per_second = 5_800_000;
		return
			cost_per_tps_per_second *
			tps *
			timeSeconds +
			uint128(howManyDeployersNeed(tps)) *
			(value_for_deployer_gas + value_for_recursive_trinity_call_gas);
	}

	function howManyDeployersNeed(uint32 tps) public pure returns (uint32) {
		return tps;
	}

	function withdraw(address _to) public pure onlyOwnerOrSelf {
		tvm.accept();
		tvm.rawReserve(0.1 ever, 0);
		_to.transfer(0, false, 128);
	}
}
