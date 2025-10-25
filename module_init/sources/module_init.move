module module_init::module_init;

// Has only drop ability.
// Has no fields.
// Is not a generic type.
// Named after the module with all uppercase letters.
public struct MODULE_INIT has drop {}

public struct MyShop has key {
    id: UID
}

fun init(otw: MODULE_INIT,ctx: &mut TxContext) {
    let richieShop = MyShop {
        id: object::new(ctx)
    }

    transfer::share_object(richieShop);
}
