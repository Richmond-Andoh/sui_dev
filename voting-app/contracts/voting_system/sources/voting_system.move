
/// Module: voting_system
module voting_system::dashboard;

use std::string::String;
// struct has key ability

public struct Proposal has key {
    id: UID,
    title: String,
    description: String,
    voted_yes_count: u64,
    voted_no_count: u64,
    expiration: u64,
    author: address,
    voter_registry: vector<address>
}

public fun create_proposal(
    title: String,
    description: String,
    expiration: u64,
    ctx: &mut TxContext
) {
    let proposal: Proposal = Proposal {
        id: object::new( ctx),
        title,
        description,
        voted_yes_count: 0,
        voted_no_count: 0,
        expiration,
        author: ctx.sender(),
        voter_registry: vector[]
    };

    transfer::share_object( proposal);
}