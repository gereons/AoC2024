//
// Advent of Code 2024 Day 5
//
// https://adventofcode.com/2024/day/5
//

import AoCTools
import Algorithms

private struct Rule: Hashable {
    let page1: Int
    let page2: Int
}

final class Day05: AdventOfCodeDay {
    let title = "Print Queue"
    private let rules: Set<Rule>
    let updates: [[Int]]

    init(input: String) {
        let groups = input.lines.grouped(by: \.isEmpty)

        rules = groups[0]
            .map { $0.integers() }
            .map { Rule(page1: $0[0], page2: $0[1]) }
            .makeSet()

        updates = groups[1]
            .map { $0.integers() }
    }

    func part1() async -> Int {
        updates
            .filter { updateOk($0) }
            .map { $0.median() }
            .reduce(0, +)
    }

    func part2() async -> Int {
        updates
            .filter { !updateOk($0) }
            .map {
                $0.sorted { p1, p2 in
                    rules.contains(Rule(page1: p1, page2: p2))
                }
            }
            .map { $0.median() }
            .reduce(0, +)
    }

    private func updateOk(_ update: [Int]) -> Bool {
        update
            .combinations(ofCount: 2)
            .map { Rule(page1: $0[0], page2: $0[1]) }
            .allSatisfy { rules.contains($0) }
    }
}
