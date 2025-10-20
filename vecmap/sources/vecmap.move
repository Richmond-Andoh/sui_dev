module vecmap::vec_map;

use std::string::String;
use sui::vec_map::{Self, VecMap};

public struct Metadata has drop {
	name: String,
	attributes: VecMap<String, String>
}

# [tes_only]

fun vec_map_playground() {
	let mut map = vec_map::empty();

	map.insert(2, b"two".to_string());
	map.insert(3, b"three".to_string());

	assert!(map.contains(&2));
	debug::print(&map)

	map.remove(&3);
}
