/* This smartcontract is aimed at controlling how funds are released for a Crowdfunding project. It is meant to ensure the deliverables are met break
before more funds is released to the vendor.
Enforces accountability in Crowdfunding checkProjectStatus
It is my very first project, Kindly correct, critique but don't judge.*/
pragma solidity >= 0.5.3 <0.6.0; // the solidity version is equals to or greater than 0.5.3 and less than or equals to 0.6.6
import "./crowdProject.sol";
contract crowdStatus is crowdProject {
    uint projectFund; // the total amount of the project
    uint amount = projectFund/4; // amount released after every phase
   
    event releaseFunds(uint amount);
   
   function checkProjectStatus(uint _status) public returns (string memory) {
       uint startProject = 0;
       uint phase1 = 25;
       uint phase2 = 50;
       uint phase3 = 75;
       uint phase4 = 100; // the percentage of project when completed
       if (_status == startProject) {
           return "The project is starting";
       }
       emit releaseFunds(amount); //release 25% of project funds when phase 1 is completed.
       if (_status >= phase1) {
           return "Phase 1 Complete";
       }
       emit releaseFunds(amount); //release 25% of project funds when phase 1 is completed.
       
       if (_status >= phase2) {
           return "Phase 2 Complete";
       }
       emit releaseFunds(amount); //release 25% of project funds when phase 1 is completed.
       if(_status >= phase3) {
           return "Phase 3 is complete";
       }
       emit releaseFunds(amount); //release 25% of project funds when phase 1 is completed.
       if (_status == phase4){
           return "Project complete";
       }
       else {
           return "Complete Project Phase to get funding";
       }
   }
}
