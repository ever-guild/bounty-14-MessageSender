pragma ton-solidity 0.58.1;

import "./MS.sol";

contract MSDeployer is MS{
    function getShardNumber() public returns(uint8){

    }

    function deployMS(uint128 amount) public pure returns(address){
        tvm.accept();
        TvmCell _code = getMSCode();

        address _addr = new MS{
            value: amount,
            code: _code,
            bounce: true,
            pubkey: msg.pubkey()
        }();
        return _addr;
    }

    function calculateAddress() public pure returns(uint256){
        tvm.accept();
        TvmCell _code = getMSCode();
        TvmCell _data = tvm.buildDataInit({
            contr: MS,
            varInit: {},
            pubkey: msg.pubkey()
        });
        
        uint256 _addr = tvm.stateInitHash(tvm.hash(_code), tvm.hash(_data), _code.depth(), _data.depth());
        return _addr;
    }

    function getMSDeployerCode() public pure returns(TvmCell){
        return tvm.code();
    }
}