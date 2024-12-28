//
// Advent of Code 2024 Day 1
//
// https://adventofcode.com/2024/day/1
//

import AoCTools

final class Day01: AOCDay {
    let title = "Historian Hysteria"

    let left: [Int]
    let right: [Int]

    init(input: String) {
        let pairs = input.lines
            .map { $0.integers() }

        left = pairs.map { $0[0] }
        right = pairs.map { $0[1] }
    }

    func part1() -> Int {
        zip(left.sorted(by: <), right.sorted(by: <))
            .map { abs($0 - $1) }
            .reduce(0, +)
    }

    func part2() -> Int {
        let rightFreq = Dictionary(right.map { ($0, 1) }, uniquingKeysWith: +)
        return left
            .map { $0 * rightFreq[$0, default: 0] }
            .reduce(0, +)
    }
}
