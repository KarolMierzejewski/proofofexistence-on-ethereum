const ProofOfExistence1 = artifacts.require('ProofOfExistence1');

contract('TestProofOfExistence2', async function() {
	let poe = await ProofOfExistence1.deployed();
	
	it('Proof of Existence notarize seems to be working!', async () => {
		await poe.notarize('Kopalnia Programisty');
		
		let returned = await poe.proof();
		let expected = await poe.proofFor('Kopalnia Programisty');
		
		assert.equal(returned, expected,'Proof of Existence notarize error');
	})
})