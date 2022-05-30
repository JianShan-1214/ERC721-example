const web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");

const contractAddress = "";

const ABI = []

export default new web3.eth.Contract(ABI,contractAddress);