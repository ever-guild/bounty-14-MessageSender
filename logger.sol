    
    pragma ton-solidity 0.58.1;

    import './utils.sol';

    contract Logger is Utils {
        //32+32+8+8=80
        struct Log {
            uint32 srcTime; //createdAt in source message contract
            uint32 destTime; //now in this dest(this) contract    
            uint8 srcShardNumber; //shard number source contract
            uint8 destShardNumber; //shard number(this) contract            
        }       

        mapping (uint64=>Log) public dbLog;//uint64 is logical time of transaction    

        function addToLog(uint32 _srcTime, uint8 _srcShardNumber) public returns(uint8 _currentContractShardNumber){
            _currentContractShardNumber = getShardNumber(address(this).value);

            dbLog.add(tx.timestamp, Log(_srcTime, now, _srcShardNumber, _currentContractShardNumber));
        }
    }
    