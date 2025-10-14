module counter::counter;

public struct Counter has key {
    id: UID,
    value: u64,
    owner: address,
}


public fun create(ctx: &mut TxContext) {
    transfer::share_object(Counter {
        id: object::new(ctx),
        value: 0,
        owner: ctx.sender()
    })
}

public fun increement(counter: &mut Counter) {
    counter.value = counter.value + 1;
}

public fun set_value(counter: &mut Counter, value: u64, ctx: &TxContext){
    assert!(counter.owner == ctx.sender(), 0);
    counter.value = value;
}