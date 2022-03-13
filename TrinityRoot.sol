pragma ton-solidity 0.58.1;

import './MSDeployer.sol';

contract TrinityRoot {
    TvmCell static MSDeployerCode;
    TvmCell static MScode;
    
    function deployMSDeployer(uint128 amount) public view returns(address){
        tvm.accept();        
        address _addr = new MSDeployer{
            value: amount,
            code: MSDeployerCode,
            bounce: true,
            varInit: {msCode: MScode}
        }();
        return _addr;
    }
}

