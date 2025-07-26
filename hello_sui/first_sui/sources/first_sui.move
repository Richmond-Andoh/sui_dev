/*
/// Module: first_sui
module first_sui::first_sui;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module first_sui::HelloWorld {


    use std::string::String;


    public fun hello() : String {
        b"Hello, World!".to_string()
    }

}
