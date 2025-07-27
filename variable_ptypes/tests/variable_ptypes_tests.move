
#[test_only]
module variable_ptypes::variable_ptypes_tests;
// uncomment this line to import the module
// use variable_ptypes::variable_ptypes;
use variable_ptypes::variable_ptypes;

const ENotImplemented: u64 = 0;

#[test]
fun test_variable_ptypes() {
   variable_ptypes::main();
}

#[test, expected_failure(abort_code = ::variable_ptypes::variable_ptypes_tests::ENotImplemented)]
fun test_variable_ptypes_fail() {
    abort ENotImplemented
}

