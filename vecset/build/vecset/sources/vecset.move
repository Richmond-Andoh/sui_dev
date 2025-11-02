
module vecset::vecset;

use sui::vec_set::{Self, VecSet};

public struct Book has drop {
    subscribers: VecSet<address>,
}

#[test_only]

use std::unit_test::assert_eq;

#[test]
fun vec_set_playground() {
    let set = vec_set::empty<u8>();
    let mut set = vec_set::singleton(1);

    set.insert(2);
    set.insert(3);

    assert!(set.contains(&1));
    assert!(set.contains(&2));
    assert!(set.length() == 3);
    assert!(!set.is_empty());

    //set.remov($2);
    assert!(!set.contains(&2));
}