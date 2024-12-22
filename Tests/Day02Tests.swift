//
// Advent of Code 2024 Day 2 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
"""

@Suite("Day 2 Tests")
struct Day02Tests {
    @MainActor @Test("Day 2 Part 1", .tags(.testInput))
    func testDay02_part1() {
        let day = Day02(input: testInput)
        #expect(day.part1() == 2)
    }

    @MainActor @Test("Day 2 Part 1 Solution")
    func testDay02_part1_solution() {
        let day = Day02(input: Day02.input)
        #expect(day.part1() == 411)
    }

    @MainActor @Test("Day 2 Part 2", .tags(.testInput))
    func testDay02_part2() {
        let day = Day02(input: testInput)
        #expect(day.part2() == 4)
    }

    @MainActor @Test("Day 2 Part 2 Solution")
    func testDay02_part2_solution() {
        let day = Day02(input: Day02.input)
        #expect(day.part2() == 465)
    }
}
