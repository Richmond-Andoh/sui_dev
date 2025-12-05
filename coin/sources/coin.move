Module coin::coin;

use sui::coin_registry::{Self, CoinRegistry};
use sui::coin::{Coin, TreasuryCap, Currency};

public struct MyCoin has key {
   id: UID
}

public fun create_coin(coin_registry: &mut CoinRegistry, ctx: &mut TxContext) {
   let (mut coin_init, mut treasury_cap) = coin_registry::new_currency<MyCoin>(
      registry: coin_registry,
      decimals: 9,
      symbol: b"RN".to_string(),
      name: b"Richie Coin".to_string(),
      description: b"Richmond Andoh's Coin".to_string(),
      icon_url: b"https://imgs.search.brave.com/pKH05BVyIzzdsLpIOMg7plW2805Ffi3kVzYzNEwKgw0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4t/aWNvbnMtcG5nLmZs/YXRpY29uLmNvbS8x/MjgvOTU5MC85NTkw/MTQ0LnBuZw".to_string(),
      ctx: ctx
   );

   let total_supply = treasury_cap.mint(1000_000000000, ctx);
   let metadata_cap = coin_init.finalize(ctx);

   transfer::public_transfer(metadata_cap, ctx.sender());
   transfer::public_transfer(total_supply, ctx.sender());
   transfer::public_transfer(treasury_cap, ctx.sender());
}

public fun mint(treasury_cap: &mut TreasuryCap<MyCoin>, amount: u64, ctx: &mut TxContext){
  let new_supply = treasury_cap.mint(amount, ctx);
  transfer::public_transfer(new_supply, ctx.sender);
}

public fun burn_coin(coin: Coin<MyCoin>, currency: &mut Currency) {
   currency.burn(coin);
}
