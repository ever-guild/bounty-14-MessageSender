pragma ton-solidity 0.58.1;

import "./MS.sol";

contract MSDeployer is MS{
    function checkShardNumber() public returns(uint8){

    }

    function deployMS(uint128 amount) public pure returns(address){
        tvm.accept();
        TvmCell _code = getMSDeployerCode();
        address _addr = new MSDeployer{
            value: amount,
            code: _code,
            bounce: true
        }();
        return _addr;
    }

    function calculateHash() public view returns(uint256){
        tvm.accept();
        TvmCell _code = getMSCode();
        TvmCell _data = getMSData();
        uint256 hash = tvm.stateInitHash(tvm.hash(_code), tvm.hash(_data), _code.depth(), _data.depth());
        return hash;
    }

    function getMSDeployerCode() public pure returns(TvmCell){
        return tvm.code();
    }
}