import { useConnectWallet, useCurrentAccount, useWallets } from '@mysten/dapp-kit';
import { isEnokiWallet, type EnokiWallet, type AuthProvider } from '@mysten/enoki';
// import { ConnectButton } from '@mysten/dapp-kit';

const Register = () => {

    const currentAccount = useCurrentAccount();
	const connectWallet = useConnectWallet();
 
	const wallets = useWallets().filter(isEnokiWallet);
    console.log("Wallets: ", wallets);
    
	const walletsByProvider = wallets.reduce(
		(map, wallet) => map.set(wallet.provider, wallet),
		new Map<AuthProvider, EnokiWallet>(),
	);
 
	const googleWallet = walletsByProvider.get('google');    
	const facebookWallet = walletsByProvider.get('facebook');
 
	if (currentAccount) {
		return <div>Current address: {currentAccount.address}</div>;
	}

  return (
    <div>
        <h1>Welcome to the Register Page</h1>
        {googleWallet ? (
				<button
					onClick={() => {
						connectWallet.mutate({ wallet: googleWallet });
					}}
				>
					Sign in with Google
				</button>
			) : null}
			{facebookWallet ? (
				<button
					onClick={() => {
						connectWallet.mutate({ wallet: facebookWallet });
					}}
				>
					Sign in with Facebook
				</button>
			) : null}

           {/* <ConnectButton /> */}
    </div>
  )
}

export default Register;
