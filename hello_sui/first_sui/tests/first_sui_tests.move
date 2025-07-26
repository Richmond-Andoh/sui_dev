
#[test_only]
module first_sui::first_sui_tests;

use first_sui::HelloWorld;
use richie_sui::Richmond;
use std::debug;

const ENotImplemented: u64 = 0;

#[test]
fun test_first_sui() {
    debug::print(& HelloWorld::hello())
}
#[test]
fun test_richie_sui() {
    debug::print(& Richmond::say_richie())
}

#[test, expected_failure(abort_code = ::first_sui::first_sui_tests::ENotImplemented)]
fun test_first_sui_fail() {
    abort ENotImplemented
}

