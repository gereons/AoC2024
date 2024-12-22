//
// Advent of Code 2024 Day 9 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
2333133121414131402
"""

@Suite("Day 9 Tests")
struct Day09Tests {
    @MainActor @Test("Day 9 Part 1", .tags(.testInput))
    func testDay09_part1() {
        let day = Day09(input: testInput)
        #expect(day.part1() == 1928)
    }

    @MainActor @Test("Day 9 Part 1 Solution")
    func testDay09_part1_solution() {
        let day = Day09(input: Day09.input)
        #expect(day.part1() == 6320029754031)
    }

    @MainActor @Test("Day 9 Part 2", .tags(.testInput))
    func testDay09_part2() {
        let day = Day09(input: testInput)
        #expect(day.part2() == 2858)
    }

    @MainActor @Test("Day 9 Part 2 Solution")
    func testDay09_part2_solution() {
        let day = Day09(input: Day09.input)
        #expect(day.part2() == 6347435485773)
    }
}
