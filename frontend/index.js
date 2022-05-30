const web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");
import contract from "./contract.mjs";

const vm = Vue.createApp({
    data(){
        return {
            isConnected: false,
            account: ""
        }
    },
    methods: {
        async requestETH(){
            const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
            this.account = accounts[0];
            this.isConnected = true;
        },
        async mint(){
            await contract.methods.mint().send({
                from: this.account,
                value: web3.utils.toWei("0.05", 'ether'),
            })
        }
    }
});

vm.mount("#app");