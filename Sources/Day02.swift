//
// Advent of Code 2024 Day 2
//
// https://adventofcode.com/2024/day/2
//

import AoCTools
import Algorithms

private struct Report {
    let data: [Int]
    let pairs: [(Int, Int)]

    init(data: [Int]) {
        self.data = data
        self.pairs = data.adjacentPairs().map { ($0.0, $0.1) }
    }

    var isSafe: Bool {
        let expectedSign = (pairs[0].0 - pairs[0].1).signum()
        return pairs.allSatisfy { diffOk($0.0, $0.1, expectedSign) }
    }

    var isSafeWithDampener: Bool {
        if isSafe {
            return true
        }

        let firstNonInc = pairs
            .enumerated()
            .first { _, element in !diffOk(element.0, element.1, 1) }
        let firstNonDec = pairs
            .enumerated()
            .first { _, element in !diffOk(element.0, element.1, -1) }

        for check in [firstNonInc!, firstNonDec!] {
            for index in [check.0, check.0 + 1] {
                var data = self.data
                data.remove(at: index)
                let report = Report(data: data)
                if report.isSafe {
                    return true
                }
            }
        }

        return false
    }

    func diffOk(_ a: Int, _ b: Int, _ expectedSign: Int) -> Bool {
        (a - b).signum() == expectedSign && 1...3 ~= abs(a - b)
    }
}

final class Day02: AdventOfCodeDay {
    let title = "Red-Nosed Reports"

    private let reports: [Report]

    init(input: String) {
        reports = input.lines.map { Report(data: $0.integers()) }
    }

    func part1() async -> Int {
        reports
            .filter { $0.isSafe }
            .count
    }

    func part2() async -> Int {
        reports
            .filter { $0.isSafeWithDampener }
            .count
    }
}
