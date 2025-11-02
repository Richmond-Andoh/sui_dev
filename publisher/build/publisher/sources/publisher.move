module publisher::publisher;

// publisher is a proof of ownership of an object/asset

use sui::package::{Self, Publisher};
use std::string::String;

public struct PUBLISHER has drop {}

public struct Book has key {
    id: UID,
    title: String,
}

fun init(otw: PUBLISHER, ctx: &mut TxContext){
    let publisher = package::claim(otw, ctx);

    transfer::public_transfer(publisher, ctx.sender());
}

public fun admin_create_book(cap: &Publisher, title: String, ctx: &mut TxContext){
    // check if the publisher is from the same module
    assert!(cap.from_module<Book>());

    // also checko if the publisher is from the same package
    // assert!(cap.from_package<Book>());


    // Test for the capability
    //assert!(cap.from_module<Book>());
  // Old Publisher ID 0x451789884568bdc62df895cdbb19c5f4fbbe29b18fe086a164c9d5341e6c3cb5
  // New Publisher ID 0x7c19104b7309ca76a25c5b0ec2db67d2b82649d3b520ba5038bf06f9c55720a8
    let book = Book {
        id: object::new(ctx),
        title
    };

    transfer::share_object(book);
}
