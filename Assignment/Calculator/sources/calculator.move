/*
/// Module: calculator
module calculator::calculator;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module calculator::calculator {

   // use std::debug
   //use sui::assert;

   // Five functions

   // 1. Add
    fun add(a: u8, b: u8) : u32 {
       // perform addtion
       let sum = a + b;
       return sum as u32
    }


   // 2. Subtract
    fun subtract(a: u8, b: u8) : u32 {
      assert!(a >= b, 0);
      let difference = a - b;
      return difference as u32
    }

   // 3. Multiply
    fun multiply(a: u8, b: u8) : u32 {
     let product = a * b;
     return product as u32
    }

    // 4. Divide
    fun divide(a: u8, b: u8) : u32 {
      assert!(b != 0, 1);
      let quotient = a / b;
      return quotient as u32

    }

    public fun answer(a: u16, b: u16) : (u64, u64, u64, u64) {
       let a1 = a as u8;
       let b1 = b as u8;
       
       let sum = add(a1, b1) as u64;
       let difference = subtract(a1, b1) as u64;
       let product = multiply(a1, b1);
       let quotient = divide(a1, b1);

       (sum, difference, product as u64, quotient as u64)
    }
}
