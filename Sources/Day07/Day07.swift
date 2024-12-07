//
// Advent of Code 2024 Day 7
//
// https://adventofcode.com/2024/day/7
//

import AoCTools
import Foundation

final class Day07: AOCDay {
    let title = "Bridge Repair"

    let equations: [[Int]]
    init(input: String) {
        equations = input.lines.map { $0.allInts() }
    }

    func part1() -> Int {
        equations
            .compactMap { solve($0) }
            .reduce(0, +)
    }

    func part2() -> Int {
        equations
            .compactMap { solve($0, part2: true) }
            .reduce(0, +)
    }

    private func solve(_ equation: [Int], part2: Bool = false) -> Int? {
        solve(
            equation,
            expected: equation[0],
            index: 2,
            partial: equation[1],
            part2: part2
        )
    }

    private func solve(_ equation: [Int], expected: Int, index: Int, partial: Int, part2: Bool) -> Int? {
        if partial > expected {
            return nil
        }
        if index == equation.count {
            return expected == partial ? partial : nil
        }

        if part2, let result = solve(equation, expected: expected, index: index + 1, partial: cat(partial, equation[index]), part2: part2) {
            return result
        }
        if let result = solve(equation, expected: expected, index: index + 1, partial: partial + equation[index], part2: part2) {
            return result
        }
        return solve(equation, expected: expected, index: index + 1, partial: partial * equation[index], part2: part2)
    }

    private func cat(_ a: Int, _ b: Int) -> Int {
        var a = a
        var tmp = b
        while tmp > 0 {
            a *= 10
            tmp /= 10
        }
        return a + b
    }

}
