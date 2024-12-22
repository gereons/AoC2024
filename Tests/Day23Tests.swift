//
// Advent of Code 2024 Day 23 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
"""

@Suite("Day 23 Tests")
struct Day23Tests {
    @MainActor @Test("Day 23 Part 1", .tags(.testInput))
    func testDay23_part1() {
        let day = Day23(input: testInput)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 23 Part 1 Solution")
    func testDay23_part1_solution() {
        let day = Day23(input: Day23.input)
        #expect(day.part1() == 0)
    }

    @MainActor @Test("Day 23 Part 2", .tags(.testInput))
    func testDay23_part2() {
        let day = Day23(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 23 Part 2 Solution")
    func testDay23_part2_solution() {
        let day = Day23(input: Day23.input)
        #expect(day.part2() == 0)
    }
}
