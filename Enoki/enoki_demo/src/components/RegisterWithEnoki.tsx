import { isEnokiNetwork, registerEnokiWallets, type EnokiNetwork } from "@mysten/enoki";
import { useSuiClientContext } from "@mysten/dapp-kit";
import { useEffect } from "react";

const RegisterWithEnoki = () => {

    const { client, network } = useSuiClientContext();


    useEffect(() => {
        if(!isEnokiNetwork(network)) return;

        const { unregister } = registerEnokiWallets({
            apiKey: import.meta.env.VITE_ENOKI_API,
            providers: {
                google: {
                    clientId: import.meta.env.VITE_GOOGLE_CLIENT_ID,
                }
            },
            client,
            network: network as EnokiNetwork // Cast to the expected type if you are sure it's compatible
        });

        return unregister;
    }, [client, network]);
  return null;
};


export default RegisterWithEnoki;
