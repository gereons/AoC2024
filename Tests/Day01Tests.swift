//
// Advent of Code 2024 Day 1 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
3   4
4   3
2   5
1   3
3   9
3   3
"""

@Suite("Day 1 Tests")
struct Day01Tests {
    @MainActor @Test("Day 1 Part 1", .tags(.testInput))
    func testDay01_part1() {
        let day = Day01(input: testInput)
        #expect(day.part1() == 11)
    }

    @MainActor @Test("Day 1 Part 1 Solution")
    func testDay01_part1_solution() {
        let day = Day01(input: Day01.input)
        #expect(day.part1() == 1341714)
    }

    @MainActor @Test("Day 1 Part 2", .tags(.testInput))
    func testDay01_part2() {
        let day = Day01(input: testInput)
        #expect(day.part2() == 31)
    }

    @MainActor @Test("Day 1 Part 2 Solution")
    func testDay01_part2_solution() {
        let day = Day01(input: Day01.input)
        #expect(day.part2() == 27384707)
    }
}
