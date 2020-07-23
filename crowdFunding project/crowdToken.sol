
pragma solidity >= 0.5.3 <0.6.0;
import "./crowdProject.sol";

contract crowdToken is crowdProject {
    event NewShares(uint shareid, string _shareName, uint _amount);
    uint projectShares = 75; // project Budget is equal to 75% stake on the project, 25% is maintained to the project owner. 
    uint projectBudget = projectShares;
     //Investor's account
    struct Investor {
        string fullNames;
        string mail;
    }
    struct share {
        string shareName;
        uint sharevalue;
    }
    share [] shares;
    mapping (address => Investor) public Investors;
    Investor [] investors;
    mapping(address => uint) public investor;
    //mapping (address => string) public investor;
   mapping (uint => address) public sharevalue;
   mapping (address => uint) public Shares;

     
    function _investors(string memory _fullNames, string memory _mail) private returns(string memory) {
        //investor[msg.sender] = _fullNames;
        investors.push(Investor(_fullNames, _mail));
        return _fullNames;
    

    }
    function investment(string memory _shareName, uint _sharevalue) public returns(uint) {
       // Shares[msg.sender] = _amount;
        uint id = shares.push(share(_shareName, _sharevalue)) -1 ;
        sharevalue[id] = msg.sender;
        investor[msg.sender]++;
        emit NewShares(id, _shareName, _sharevalue);
        uint stake = (_sharevalue / projectBudget) * 100;
        return stake;
        
    }
}