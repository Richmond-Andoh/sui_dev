module clock::clock;

use sui::clock::Clock;
use std::debug;

// public struct Clock has key {
//     id: UID,
//     timestamp_ms: u64
// }

public fun current_time(clock: &Clock){
    let time = clock.timestamp_ms();

    debug::print(time);
}
