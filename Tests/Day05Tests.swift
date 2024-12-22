//
// Advent of Code 2024 Day 5 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47
"""

@Suite("Day 5 Tests")
struct Day05Tests {
    @MainActor @Test("Day 5 Part 1", .tags(.testInput))
    func testDay05_part1() {
        let day = Day05(input: testInput)
        #expect(day.part1() == 143)
    }

    @MainActor @Test("Day 5 Part 1 Solution")
    func testDay05_part1_solution() {
        let day = Day05(input: Day05.input)
        #expect(day.part1() == 5268)
    }

    @MainActor @Test("Day 5 Part 2", .tags(.testInput))
    func testDay05_part2() {
        let day = Day05(input: testInput)
        #expect(day.part2() == 123)
    }

    @MainActor @Test("Day 5 Part 2 Solution")
    func testDay05_part2_solution() {
        let day = Day05(input: Day05.input)
        #expect(day.part2() == 5799)
    }
}
