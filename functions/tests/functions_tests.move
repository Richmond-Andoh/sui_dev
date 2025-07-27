
#[test_only]
module functions::functions_tests;
// uncomment this line to import the module
use functions::move_functions;
use test::test_move;
use std::debug;

const ENotImplemented: u64 = 0;

#[test]
fun test_functions() {
    let sum : u8 = move_functions::call_add(76, 32);
    debug::print(& sum);

    let multiply : u32 = test_move::call_multiply(32, 65);
    debug::print(& multiply)
}

#[test, expected_failure(abort_code = ::functions::functions_tests::ENotImplemented)]
fun test_functions_fail() {
    abort ENotImplemented
}

