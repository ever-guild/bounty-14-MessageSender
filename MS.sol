pragma ton-solidity 0.58.1;

contract MS {
    function mode0() public {
        
    }

    function mode1() public {

    }

    function mode2() public {
        
    }

    function getMSCode() public pure returns(TvmCell){
        return tvm.code();
    }
    
    function getMSData() public view returns(TvmCell){
        return tvm.getData();
    }
}