module functions::move_functions;

//internal functions

fun add(num1: u8, num2 : u8) : u8 {
    let sum = num1 + num2;
    return sum
}

fun subtract(num1 : u16, num2 : u16) : u16 {
    let difference = num1 - num2;
    return difference
}

public fun multiply(num1 : u32, num2 : u32) : u32 {
    let product = num1 * num2;
    // return product
    product
}

fun division(num1 : u64, num2 : u64) : u64 {
    let divide = num1 / num2;
    // return divide
    divide
}

public fun call_add(num1: u8, num2 : u8) : u8 {
    add(num1, num2)
}

// public fun call_all(num1 : u64, num2 : u64) : u64 {
//     division(num1, num2);
//     multiply(num1, num2);
//     subtract(num1, num2);
//     add(num1. num2)

// }