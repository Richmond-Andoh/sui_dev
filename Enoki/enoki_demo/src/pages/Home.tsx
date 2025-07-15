import { useCurrentAccount } from '@mysten/dapp-kit';
import { Link } from 'react-router-dom';

const Home = () => {
    const currentAccount = useCurrentAccount();

    if(!currentAccount){
        return (
            <div>
            <h1>You're not Logged In</h1>
            <div>
                <Link to="/register">Sign In</Link>
            </div>
            </div>
        )

    }
  return (
    <div>
      <h1>Welcome: {currentAccount.address}</h1>
      <p>You're Logged In.</p>
    </div>
  )
}

export default Home;
