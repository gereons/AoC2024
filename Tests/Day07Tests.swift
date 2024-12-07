//
// Advent of Code 2024 Day 7 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20
"""

@Suite("Day 7 Tests")
struct Day07Tests {
    @MainActor @Test("Day 7 Part 1")
    func testDay07_part1() {
        let day = Day07(input: testInput)
        #expect(day.part1() == 3749)
    }

    @MainActor @Test("Day 7 Part 1 Solution")
    func testDay07_part1_solution() {
        let day = Day07(input: Day07.input)
        #expect(day.part1() == 20281182715321)
    }

    @MainActor @Test("Day 7 Part 2")
    func testDay07_part2() {
        let day = Day07(input: testInput)
        #expect(day.part2() == 11387)
    }

    @MainActor @Test("Day 7 Part 2 Solution")
    func testDay07_part2_solution() {
        let day = Day07(input: Day07.input)
        #expect(day.part2() == 159490400628354)
    }
}
