/*
/// Module: structs
module structs::structs;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module structs::structs;

    use std::debug;
    //use std::string;

    // Struct definition

    // Names Field Structs (use named fields for better readability || use name field to access values)

    // public structs
    public struct MyStruct()

    public struct Student has key {
        id:  UID, // default field
        age: u8,
        isMale: bool,
        grades: Grade// referencing the Grade struct in the Student struct

    }

    public struct Grade {
        math: u8,
        science: u8,
        english: u8
    }

    public fun create_student(student_age: u8, is_male: bool, math: u8, science: u8, english: u8) : Student {
        // let student1 : Student = Student {
        //     name: student_name,
        //     age: student_age,
        //     isMale: is_male,
        //     grades: Grade {
        //         math: math,
        //         science: science,
        //         english: english
        //     };
        // };

        let grades: Grade = Grade {
            math,
            science,
            english
        };

        let student: Student = Student {
            //name: student_name,
            age: student_age,
            isMale: is_male,
            grades
        };

        //return student;
        student
    }

    public fun get_students(student: Student) : (u8, bool, u8, u8, u8) {
        // Accessing the fields of the Student struct one by one
        //let name = student.name;
        let age = student.age;
        let isMale = student.isMale;
        //let grade = student.grades;

        // Print the values
        //debug::print(&name);
        debug::print(&age);
        debug::print(&isMale);
        //debug::print(&grade);

        // Destructure Struct
        //let Student { name, age, isMale, grades } = student;

       // Another way of destructuring
       let Student {age, isMale, grades: Grade { math, science, english } } = student; 

       return (age, isMale, math, science, english)

    }


   // Postional Structs (use index to access values)

    public struct My_Struct2()

    public struct Points3D(u64, u64, u64)

    public fun create_cord() : Points3D {
      let points = Points3D(20, 30, 43);
      points
    }
 
    public fun get_points(points: Points3D) : (u64, u64, u64) {
      //let x_cord = points.0;
      
    
      let x;
      let y;
      let z;

      Points3D(x, y, z) = points;
      (x, y, z)
    }


module structs::structs_abilities;
    
    public struct Grade has copy, drop {
        math: u8,
        science: u8,
        english: u8
    };


    public fun create_grade(){
        let grade1: Grade = Grade {
            math: 20,
            science: 30,
            english: 21
        }

        let mut grade2: Grade = Grade {
            math: 20,
            science: 30,
            english: 21
        };

        debug::print(&grade1);
        debug::print(&grade2);
    }