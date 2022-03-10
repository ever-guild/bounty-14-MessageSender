pragma ton-solidity 0.58.1;

import "./MS.sol";

contract MSDeployer is MS{

    address[] public ms;
    
    function getShardNumber(uint _addr) private pure returns(uint8){
        return uint8(_addr >> 252);
    }

    function deployMS(uint128 amount) public returns(address){
        tvm.accept();
        TvmCell _code = getMSCode();    
        for ((, uint _salt) : getSalts()) {
            address _addr = new MS{
                value: amount,
                code: _code,
                bounce: true,
                varInit: {salt: _salt},
                pubkey: msg.pubkey()
            }();
            ms.push(_addr);
        }       
    }

    function getSalts() private pure returns(mapping (uint8=>uint256)){      
        TvmCell _code = getMSCode();
        mapping (uint8=>uint256) salts;
        uint8 counter = 0; // counter for salts ( only 3 needed )
        while(counter < 3){
            uint _salt = rnd.next(now);//salt must be unique
            TvmCell _data = tvm.buildDataInit({
                contr: MS,
                varInit: {salt: _salt},
                pubkey: msg.pubkey()
            });

            uint256 _addr = tvm.stateInitHash(tvm.hash(_code), tvm.hash(_data), _code.depth(), _data.depth());
            uint8 shardNumber = getShardNumber(_addr);           
            if(salts.add(shardNumber, _salt)){
                counter++;
            }
        }

        return salts;
    }

    function getMSDeployerCode() public pure returns(TvmCell){
        return tvm.code();
    }
}