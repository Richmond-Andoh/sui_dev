module coin_balance::coin_balance;

use sui::balance::{Self, Balance};
use sui::sui::SUI;
use sui::coin::{Self, Coin};

public struct Vault has key, store {
    id: UID,
    balance: Balance<SUI>,
    owner: address,
}

public fun create_vault(ctx: &mut TxContext) {
    let vault = Vault {
        id: object::new(ctx),
        balance: balance::zero<SUI>(),
        owner: ctx.sender()
    };

    transfer::public_transfer(vault, ctx.sender());
}

public fun deposit(vault: &mut Vault, coin: Coin<SUI>){
    let coin_bal = coin.into_balance();
    vault.balance.join(coin_bal);
}

public fun withdraw(vault: &mut Vault, amount: u64, ctx: &mut TxContext) {
    let new_bal = vault.balance.split(amount);

    // convert the new balance into coin
    // transfer the new coin balance
    let new_coin_bal = new_bal.into_coin(ctx);
    transfer::public_transfer(new_coin_bal, ctx.sender());
}

public fun withdraw_all(vault: &mut Vault, ctx: &mut TxContext){
    // Access the vault balance
    // call the withdraw method to withdraw all coins
    // convert the new balance into coin
    // transfer the new coin balance
    let new_bal = vault.balance.withdraw_all();
    let new_coin_bal = new_bal.into_coin(ctx);
    transfer::public_transfer(new_coin_bal, ctx.sender());
}

// Function to destroy vault


public fun destroy(vault: Vault, ctx: &mut TxContext){
    // Check if the vault owner is the sender
    assert!(vault.owner == ctx.sender(), 1);

    let Vault { id, balance, owner: _} = vault;
    id.delete();

    balance::destroy_zero(balance);
}

/*
public fun destroy_zero(vault: Vault){
    let Vault {id, balance, owner: _} = vault;
    id.delete();

    balance::destroy_zero(balance);
}
*/
// function to get total amout
public fun get_total_amount(vault: &Vault) : u64 {
    vault.balance.value()
}
