//
// Advent of Code 2024 Day 11
//
// https://adventofcode.com/2024/day/11
//

import AoCTools
import Foundation

final class Day11: AOCDay {
    let title = "Plutonian Pebbles"

    let stones: [Int]

    init(input: String) {
        stones = input.integers()
    }

    func part1() -> Int {
        blink(times: 25)
    }

    func part2() -> Int {
        blink(times: 75)
    }

    private func blink(times blinks: Int) -> Int {
        stones
            .map { expandStone($0, blinks) }
            .reduce(0, +)
    }

    private struct Key: Hashable {
        let stone: Int
        let blinks: Int
    }

    private var cache = [Key: Int]()

    private func expandStone(_ stone: Int, _ blinks: Int) -> Int {
        if blinks == 0 {
            return 1
        }

        let key = Key(stone: stone, blinks: blinks)
        if let result = cache[key] {
            return result
        }

        let nDigits = "\(stone)".count
        let result: Int
        if stone == 0 {
            result = expandStone(1, blinks - 1)
        } else if nDigits.isMultiple(of: 2) {
            let p = pow(10, nDigits / 2)
            result =
                expandStone(stone / p, blinks - 1) +
                expandStone(stone % p, blinks - 1)
        } else {
            result = expandStone(2024 * stone, blinks - 1)
        }

        cache[key] = result
        return result
    }

    private func pow(_ x: Int, _ y: Int) -> Int {
        Int(Foundation.pow(Double(x), Double(y)))
    }
}
