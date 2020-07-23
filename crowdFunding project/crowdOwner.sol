pragma solidity >= 0.5.3 <0.6.0;

import "./crowdToken.sol";
import "./erc721.sol";

contract crowdOwner is crowdToken, ERC721 { 
  mapping (uint => address) sharesApprovals;
  
  function balanceOf(address _owner) external view returns (uint256) {
      return investor[_owner];
  }
  function ownerOf(uint256 _tokenId) external view returns (address) {
      return sharevalue[_tokenId];
  }
  function _transfer(address _from, address _to, uint256 _tokenId) private {
    investor[_to]++;
    investor[_from]--;
    sharevalue[_tokenId] = _to;
    emit Transfer(_from, _to, _tokenId);
  }
  function transferFrom(address _from, address _to, uint256 _tokenId) external payable {
      require(sharevalue[_tokenId] == msg.sender || sharesApprovals[_tokenId] == msg.sender);
      _transfer(_from, _to, _tokenId);
      
  }

  function approve(address _approved, uint256 _tokenId) external payable {
      sharesApprovals[_tokenId] = _approved;
      emit Approval(msg.sender, _approved, _tokenId);

  }
}

