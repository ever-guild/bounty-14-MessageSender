pragma ton-solidity 0.58.1;

contract MS {
    uint static salt;
   
    address[] public MSaddresses;

    function mode0() public {}

    function mode1() public view {
        tvm.accept();
        MS(MSaddresses[0]).mode1();
    }

    function mode2() public view {
        tvm.accept();
        MS(MSaddresses[0]).mode2();
        MS(MSaddresses[1]).mode2();
    }

    function getMSCode() public pure returns(TvmCell){
        return tvm.code();
    }    

    function setMSaddresses(address[] _MSaddresses) public{
        tvm.accept();
        MSaddresses = _MSaddresses;
    }
}