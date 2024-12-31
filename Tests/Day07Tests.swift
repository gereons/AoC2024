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
    @Test("Day 7 Part 1", .tags(.testInput))
    func testDay07_part1() async {
        let day = Day07(input: testInput)
        #expect(await day.part1() == 3749)
    }

    @Test("Day 7 Part 1 Solution")
    func testDay07_part1_solution() async {
        let day = Day07(input: Day07.input)
        #expect(await day.part1() == 20281182715321)
    }

    @Test("Day 7 Part 2", .tags(.testInput))
    func testDay07_part2() async {
        let day = Day07(input: testInput)
        #expect(await day.part2() == 11387)
    }

    @Test("Day 7 Part 2 Solution")
    func testDay07_part2_solution() async {
        let day = Day07(input: Day07.input)
        #expect(await day.part2() == 159490400628354)
    }
}
