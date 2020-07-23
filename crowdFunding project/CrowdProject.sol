pragma solidity >= 0.5.3 <0.6.0;

import "./ownable.sol";
import "./safemath.sol";

contract crowdProject is Ownable {
    using SafeMath for uint256;
    struct Project {
        string pName;
        string description;
        uint budget;
        uint deadline;
        uint accountBalance;
    }
    mapping(address => Project) projectMap;
    Project[] public projects;
    address[] public projectsadd;
    
    struct developer {
        string fullNames;
        string mail;
    }
    mapping(address => developer) public developers;
    developer[] Developers;
    mapping(address => string) public projectOwner;
    mapping(address => uint) public accountBalance;
    //This function is for creating accounts for developers in need of investors. 
    function _createAccount(string memory _fullNames, string memory _mail) private returns (string memory) {
        projectOwner[msg.sender] = _fullNames;
        Developers.push(developer(_fullNames, _mail));
        return _fullNames;
    }
    //This is a project function which returns information about the project. 
    function createProject(string memory _pName, string memory _description, uint _accBalance, uint _budget, uint _deadline) public returns (string memory) {
        accountBalance[msg.sender] = _accBalance;
        projects.push(Project(_pName, _description, _accBalance, _budget, _deadline));
        return _description;
        

    }
    
    

}