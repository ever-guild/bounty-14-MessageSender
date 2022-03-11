//todo Deploy MSDeployer
pragma ton-solidity 0.58.1;

import './MSDeployer.sol';

contract TrinityRoot is MSDeployer {
 
    function deployMSDeployer(uint128 amount) public pure returns(address){
        tvm.accept();
        TvmCell _code = getMSDeployerCode();
        address _addr = new MSDeployer{
            value: amount,
            code: _code,
            bounce: true
        }();
        return _addr;
    }
}

