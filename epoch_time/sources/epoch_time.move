module epoch_time::epoch_time;

public struct EpochTime<T> has key {
    id: UID,
    lock_epoch: u64,
    item: T,
}

public fun create_epoch<T: store>(item: T, ctx: &mut TxContext) {
    let epochtime = EpochTime<T> {
        id: object::new(ctx),
        lock_epoch: ctx.epoch() + 3,
        item
    };

    transfer::transfer(epochtime, ctx.sender());
}

public fun destroy_epoch<T: key + store>(epochtime: EpochTime<T>, ctx: &mut TxContext) {
    assert!(ctx.epoch() >= epochtime.lock_epoch);

    let EpochTime<T>{id, lock_epoch: _, item } = epochtime;
    id.delete();

    transfer::public_transfer(item, ctx.sender());
}
