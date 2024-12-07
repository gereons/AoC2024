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
            .map { solve($0, ops: [add, mul]) }
            .reduce(0, +)
    }

    func part2() -> Int {
        equations
            .map { solve($0, ops: [add, mul, cat]) }
            .reduce(0, +)
    }

    private func solve(_ equation: [Int], ops: [Op]) -> Int {
        let expected = equation[0]
        let equation = Array(equation.dropFirst())

        let f = findFormula(equation, expected: expected, index: 1, partialResult: equation[0], ops: ops)
        return f ?? 0
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
            if let f = findFormula(equation, expected: expected, index: index + 1, partialResult: nextPartial, ops: ops) {
                return f
            }
        }
        return nil
    }

    typealias Op = (Int, Int) -> Int
    private func add(_ a: Int, b: Int) -> Int { a + b }
    private func mul(_ a: Int, b: Int) -> Int { a * b }
    private func cat(_ a: Int, b: Int) -> Int { Int("\(a)\(b)")! }
}
