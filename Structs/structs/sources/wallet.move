module wallet::wallet;


use std::string::String;

public struct Wallet has key {
    id: UID,
    owner_address: address,
    token: Token
}

public struct Token has copy, drop, store {
    name: String,
    balance: u64
}


public fun create_wallet(ctx: &mut TxContext){
    let wallet = Wallet {
        id: object::new(ctx),
        owner_address: ctx.sender(),
        token: Token {
            name: b"Richie Token".to_string(),
            balance: 0
        }
    };

    trnasfer::transfer(wallet, ctx.sender());
}


public fun deposit(wallet: &mut Wallet, amount: u68) {
    wallet.tooken.balance = wallet.token.balance + amount;
}