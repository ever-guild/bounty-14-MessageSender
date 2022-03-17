pragma ton-solidity 0.58.1;
pragma AbiHeader time;
pragma AbiHeader pubkey;

import "./utils.sol";
import "./MS.sol";

contract MSDeployer is Utils{

    address[] public ms;
    uint256[] public s; //salts

    TvmCell static msCode;//code MS.sol

    function deployMS(uint128 amount) public {
        tvm.accept();        
        for ((, uint _salt) : getSalts()) {
            address _addr = new MS{
                value: amount,
                code: msCode,
                bounce: true,
                varInit: {salt: _salt},
                pubkey: msg.pubkey()
            }();
            ms.push(_addr);
            s.push(_salt);
        }       
        MS(ms[0]).setMSaddresses([ms[1],ms[2]]);
        MS(ms[1]).setMSaddresses([ms[2],ms[0]]);
        MS(ms[2]).setMSaddresses([ms[0],ms[1]]);
    }

    function getSalts() private view returns(mapping (uint8=>uint256)){            
        mapping (uint8=>uint256) salts;
        uint8 counter = 0; // counter for salts ( only 3 needed )
        while(counter < 3){
            uint _salt = rnd.next(now);//salt must be unique
            TvmCell _data = tvm.buildDataInit({
                contr: MS,
                varInit: {salt: _salt},
                pubkey: msg.pubkey()
            });

            uint256 _addr = tvm.stateInitHash(tvm.hash(msCode), tvm.hash(_data), msCode.depth(), _data.depth());
            uint8 shardNumber = getShardNumber(_addr);           
            salts.add(shardNumber, _salt);
            // if(salts.add(shardNumber, _salt)){
                counter++;
            // }
        }

        return salts;
    }

    function getMSDeployerCode() public pure returns(TvmCell){
        return tvm.code();
    }
}