const web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");
import contract from "./contract.mjs";

const vm = Vue.createApp({
    data() {
        return {
            isConnected: false,
            account: "",
            tokenId: "", // Add a data property to store the token ID
        };
    },
    methods: {
        async requestETH() {
            const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
            this.account = accounts[0];
            this.isConnected = true;
        },
        async mint() {
            const result = await contract.methods.mint().send({
                from: this.account,
                value: web3.utils.toWei("0.005", 'ether'),
            });
            this.tokenId = result.events.Transfer.returnValues.tokenId; // Store the token ID after minting
        },
        async flipReveal() {
            await contract.methods.flipReveal(this.tokenId).send({ from: this.account });
        },
    }
});

vm.mount("#app");
