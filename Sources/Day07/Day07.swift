//
// Advent of Code 2024 Day 7
//
// https://adventofcode.com/2024/day/7
//

import AoCTools

final class Day07: AOCDay {
    let title = "Bridge Repair"

    let equations: [[Int]]
    init(input: String) {
        equations = input.lines.map { $0.allInts() }
    }

    func part1() -> Int {
        equations
            .compactMap { solve($0, ops: [add, mul]) }
            .reduce(0, +)
    }

    func part2() -> Int {
        equations
            .compactMap { solve($0, ops: [add, mul, cat]) }
            .reduce(0, +)
    }

    typealias Op = (Int, Int) -> Int

    private func solve(_ equation: [Int], ops: [Op]) -> Int? {
        findFormula(
            equation,
            expected: equation[0],
            index: 2,
            partialResult: equation[1],
            ops: ops
        )
    }

    private func findFormula(_ equation: [Int], expected: Int, index: Int, partialResult: Int, ops: [Op]) -> Int? {
        if partialResult > expected {
            return nil
        }
        if index == equation.count {
            return expected == partialResult ? partialResult : nil
        }

        for op in ops {
            let nextPartial = op(partialResult, equation[index])
            if let result = findFormula(equation, expected: expected, index: index + 1, partialResult: nextPartial, ops: ops) {
                return result
            }
        }
        return nil
    }

    private func add(_ a: Int, _ b: Int) -> Int { a + b }
    private func mul(_ a: Int, _ b: Int) -> Int { a * b }
    private func cat(_ a: Int, _ b: Int) -> Int { Int("\(a)\(b)")! }
}
