//
// Advent of Code 2024 Day 19
//
// https://adventofcode.com/2024/day/19
//

import AoCTools

final class Day19: AOCDay {
    let title = "Linen Layout"

    let colors: [String]
    let towels: [String]

    init(input: String) {
        let lines = input.lines
        colors = lines[0].split(separator: ", ").map { String($0) }
        towels = Array(lines.dropFirst(2))
    }

    func part1() -> Int {
        towels
            .map { waysToMake(towel: $0) }
            .count { $0 > 0 }
    }

    func part2() -> Int {
        towels
            .map { waysToMake(towel: $0) }
            .reduce(0, +)
    }

    private var cache = [String: Int]()
    private func waysToMake(towel: String) -> Int {
        if towel.isEmpty {
            return 1
        }

        var ways = 0
        for color in colors {
            if let seen = cache[towel] {
                return seen
            }

            if towel.hasPrefix(color) {
                ways += waysToMake(towel: String(towel.dropFirst(color.count)))
            }
        }

        cache[towel] = ways
        return ways
    }
}
