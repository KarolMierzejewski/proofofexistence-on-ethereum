pragma solidity ^0.4.4;

import "truffle/Assert.sol"; //biblioteka do testowania
import "truffle/DeployedAddresses.sol"; // addresy do wykorzystania przy testach 
import "../contracts/ProofOfExistence1.sol"; // kontrakt do testowania

contract TestProofOfExistence1 {
	// pobranie adresu
	ProofOfExistence1 poe = ProofOfExistence1(DeployedAddresses.ProofOfExistence1());	
	
	function testNotarize() public {
	
	// wywołujemy funkcję, która hashuje i zapisuje nasz dokument w state
	poe.notarize('Kopalnia Programisty');
	
	// pobieramy state, który siedzi w zmiennej proof i zapisujemy go do zmiennej returned
	bytes32 returned = poe.proof();

	// wykonujemy tylko hashowanie z zapisaniem hasha do zmiennej expected
	bytes32 expected = poe.proofFor('Kopalnia Programisty');
	
	// porównujemy dwa obiekty i zwracamy wynik testu
	Assert.equal(returned, expected, "Proof of Existence smart contract seems to be working!");
	}

}