
#[test_only]
module clock::clock_tests;
// uncomment this line to import the module
use clock::clock;

use std::unit_test::assert_eq;
use std::debug;

const ENotImplemented: u64 = 0;

#[test]
fun test_clock() {
    // pass


    // // Get `ctx` and create `Clock` for testing
    // let ctx = &mut tx_context::dummy();
    // let mut clock = clock::create_for_testing(ctx);
    // assert_eq!(clock.timestamp_ms(), 0);

    // // Add a value to the timestamp stored in `Clock`
    // clock.increment_for_testing(2_000_000_000);
    // assert_eq!(clock.timestamp_ms(), 2_000_000_000);

    // // Set the timestamp, but the time set must be no less than the value stored in `Clock`
    // clock.set_for_testing(3_000_000_000);
    // assert_eq!(clock.timestamp_ms(), 3_000_000_000);

    // // The following setting will fail because the time set must be at least the timestamp stored in `Clock`
    // // clock.set_for_testing(1_000_000_000);
    // // assert_eq!(clock.timestamp_ms(), 1_000_000_000);

    // // If need a shared `Clock` for testing, you can set it through this function
    // // clock.share_for_testing();

    // // `Clock` does not have a `drop` capability, so it needs to be destroyed manually at the end of the test
    // clock.destroy_for_testing();

}

#[test, expected_failure(abort_code = ::clock::clock_tests::ENotImplemented)]
fun test_clock_fail() {
    abort ENotImplemented
}
