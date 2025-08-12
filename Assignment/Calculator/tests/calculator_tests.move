
#[test_only]
module calculator::calculator_tests;
// uncomment this line to import the module
// use calculator::calculator;
use calculator::calculator;
use std::debug;

const ENotImplemented: u64 = 0;

#[test]
fun test_calculator() {
    // pass
    let (sum, difference, product, quotient) = calculator::answer(21, 3);
    debug::print(&sum);
    debug::print(&difference);
    debug::print(&product);
    debug::print(&quotient);

}

#[test, expected_failure(abort_code = ::calculator::calculator_tests::ENotImplemented)]
fun test_calculator_fail() {
    abort ENotImplemented
}

