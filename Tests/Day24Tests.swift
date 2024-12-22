//
// Advent of Code 2024 Day 24 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 24 Tests")
struct Day24Tests {
    @MainActor @Test("Day 24 Part 1", .tags(.testInput))
    func testDay24_part1() {
        let day = Day24(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 24 Part 1 Solution")
    func testDay24_part1_solution() {
        let day = Day24(input: Day24.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 24 Part 2", .tags(.testInput))
    func testDay24_part2() {
        let day = Day24(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 24 Part 2 Solution")
    func testDay24_part2_solution() {
        let day = Day24(input: Day24.input)
        #expect(day.part2() == 0)
    }
}
