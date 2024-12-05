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

final class Day05: AOCDay {
    let title = "Print Queue"
    private let rules: Set<Rule>
    let updates: [[Int]]

    init(input: String) {
        let groups = input.lines.grouped(by: \.isEmpty)

        rules = Set(groups[0]
            .map { $0.allInts() }
            .map { Rule(page1: $0[0], page2: $0[1]) }
        )

        updates = groups[1]
            .map { $0.allInts() }
    }

    func part1() -> Int {
        updates.reduce(into: 0) { sum, update in
            if updateOk(update) {
                sum += update[update.count / 2]
            }
        }
    }

    private func updateOk(_ update: [Int]) -> Bool {
        update
            .combinations(ofCount: 2)
            .map { Rule(page1: $0[0], page2: $0[1]) }
            .allSatisfy { rules.contains($0) }
    }


    func part2() -> Int {
        updates
            .filter { !updateOk($0) }
            .reduce(into: 0) { sum, invalid in
                let sorted = invalid.sorted { p1, p2 in
                    rules.contains(Rule(page1: p1, page2: p2))
                }
                sum += sorted[sorted.count / 2]
            }
    }
}
