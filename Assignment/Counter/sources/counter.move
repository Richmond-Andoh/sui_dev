module counter::counter {

public struct Counter has key {
    id: UID,
    value: u64,
    owner: address,
}

public fun create(ctx: &mut TxContext) {
    let counter = Counter {
        id: object::new(ctx),
        value: 0,
        owner: ctx.sender(),
    };

    transfer::share_object(counter);
}

public fun increment(counter: &mut Counter) {
    counter.value = counter.value + 1;
}

public fun set_value(counter: &mut Counter, value: u64, ctx: &mut TxContext) {
    assert!(counter.owner == ctx.sender(), 0);
    counter.value = value;
}

}