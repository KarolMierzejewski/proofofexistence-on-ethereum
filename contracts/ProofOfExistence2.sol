pragma solidity ^0.4.4;

// Proof of Existence version 2
contract ProofOfExistence2 {
  
  // mapping hash
  mapping (bytes32 => bool) private proofs;
  
  // store a proof of existence in the contract state
  function storeProof(bytes32 proof) private {
	proofs[proof] = true;
  }
  // calculate and store the proof for a document
  function notarize(string _document) public {
    bytes32 _proofFile = proofFor(_document);
    storeProof(_proofFile);
  }
  // helper function to get a document's keccak256
  function proofFor(string _document) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(_document));
  }
  // check if a document has been notarized
  function checkDocument(string _document) public view returns (bool) {
    bytes32 _proof = proofFor(_document);
    return hasProof(_proof);
  }
  // returns true if proof is stored
  function hasProof(bytes32 _proof) public view returns(bool) {
    return proofs[_proof];
  }
}