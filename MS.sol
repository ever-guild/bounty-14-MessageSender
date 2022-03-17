pragma ton-solidity 0.58.1;
pragma AbiHeader pubkey;

import "./logger.sol";

contract MS is Logger{
    uint static salt;
   
    address[] public MSaddresses;

    bool public stop = false;

    //stop generator
    //why it does not work?
    function mode0() public {
        // tvm.accept();        
        // stop = true;      
    }
  
     
    function mode1(uint32 _srcTime, uint8 _srcShardNumber) public {        
        tvm.accept();
        if(stop) return;
        //uint8 _currentContractShardNumber = addToLog(_srcTime, _srcShardNumber);
        //MS(MSaddresses[0]).mode1(now, _currentContractShardNumber);
        MS(MSaddresses[0]).mode1(now, 1);
    }

    function mode2(uint32 _srcTime, uint8 _srcShardNumber) public {
        tvm.accept();
        if(stop) return;
        uint8 _currentContractShardNumber =1;// addToLog(_srcTime, _srcShardNumber);
        MS(MSaddresses[0]).mode2(_srcTime, _currentContractShardNumber);
        MS(MSaddresses[1]).mode2(_srcTime, _currentContractShardNumber);
    }

    function setMSaddresses(address[] _MSaddresses) public{
        tvm.accept();
        MSaddresses = _MSaddresses;
    }
}