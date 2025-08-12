
#[test_only]
module structs::structs_tests;
// uncomment this line to import the module
// use structs::structs;
use structs::structs;
use std::debug;

const ENotImplemented: u64 = 0;

#[test]
fun test_structs() {
    let student = structs::create_student(20, true, 90, 87, 99);
    let (age, is_male, math, science, english) = structs::get_students(student);

    debug::print(&age);
    debug::print(&is_male);
    debug::print(&math);
    debug::print(&science);
    debug::print(&english);

    let points = structs::create_cord();
    let (x, y, z) = structs::get_points(points);
    debug::print(&x);
    debug::print(&y);
    debug::print(&z);
}

#[test, expected_failure(abort_code = ::structs::structs_tests::ENotImplemented)]
fun test_structs_fail() {
    abort ENotImplemented
}

