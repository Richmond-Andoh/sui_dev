
module variable_ptypes::variable_ptypes;

use std::debug;

public fun main() {
    // Data Types in MOVE
    // boolean, integers, address, bytearray, vector, struct, and reference
    // boolean -> true or false
    // integers -> 8, 16, 32, 64, 128, 256 bits
    // address -> 32 bytes, used to identify accounts
    // bytearray -> sequence of bytes, can be mutable or immutable
    // vector -> dynamic array that can hold elements of the same type
    // struct -> user-defined data type that can hold multiple fields

    let num1 : u8 = 21;
    let num2 : u8 = 42;
    let sum : u8 = num1 + num2;
    debug::print(& sum);


    // adding two different unsigned intergers
    let first_num : u8 = 21;
    let second_num : u16 = 12;

    // Adding this will give error "Incompatible integers"
    //debug::print(& (first_num  + second_num));

    // to fix this, convert any of them to be the other
    debug::print(& (first_num as u16 + second_num));

    // subtraction of integers
    let _sub1 : u8 = 213;
    let _sub2 : u8 = 62;
    let _sub3 : u16 = (_sub1 as u16) - (_sub2 as u16);

    // Boolean
    let _bool1 : bool = true;
    let _bool2 : bool = false;
    let _bool3 : bool = _bool1 && _bool2;
    //let _bool3 : bool = _bool1 || _bool2;
    debug::print(& _bool3);

}