import { getFullnodeUrl, SuiClient } from '@mysten/sui/client';
import { getFaucetHost, requestSuiFromFaucetV2} from "@mysten/sui/faucet";
import { MIST_PER_SUI } from '@mysten/sui/utils';


// replace <YOUR_SUI_ADDRESS> with your actual address, which is in the form 0x123...
const my_address = "0xc04f2343af164e8d96643d09be3425f89cc275d72d5a02b928d68dbac2b08a76";

//Create a new sui client
const rpcUrl = getFullnodeUrl('devnet')
const suiClient = new SuiClient({ url: rpcUrl});

//Convert MIST to SUI
const balance = (balance) => {
    return Number.parseInt(balance.totalBalance) / Number(MIST_PER_SUI);
};

// store the JSON representation for the SUI the address owns before using faucet
const suiBefore = await suiClient.getBalance({
    owner: my_address
});

try {
    await requestSuiFromFaucetV2({
    host: getFaucetHost('devnet'),
    recipient: my_address,
});
} catch (error) {
    console.error("Faucet request Failed:", error);
}

// store the JSON representation for the SUI the address owns after using faucet
const suiAfter = await suiClient.getBalance({
    owner: my_address
});

// Output result to console.
console.log(`Balance before faucet: ${balance(suiBefore)} SUI. Balance after faucet: ${balance(suiAfter)} SUI. Hello SUI!`);

