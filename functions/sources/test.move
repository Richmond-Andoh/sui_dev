module test::test_move;

use functions::move_functions;

public fun call_multiply(num1: u32, num2 : u32) : u32 {
    let calculate: u32 = move_functions::multiply(num1, num2);
    calculate
}