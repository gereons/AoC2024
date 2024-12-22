//
// Advent of Code 2024 Day 3 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
"""

fileprivate let testInput2 = """
xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
"""

@Suite("Day 3 Tests")
struct Day03Tests {
    @MainActor @Test("Day 3 Part 1", .tags(.testInput))
    func testDay03_part1() {
        let day = Day03(input: testInput)
        #expect(day.part1() == 161)
    }

    @MainActor @Test("Day 3 Part 1 Solution")
    func testDay03_part1_solution() {
        let day = Day03(input: Day03.input)
        #expect(day.part1() == 175015740)
    }

    @MainActor @Test("Day 3 Part 2", .tags(.testInput))
    func testDay03_part2() {
        let day = Day03(input: testInput2)
        #expect(day.part2() == 48)
    }

    @MainActor @Test("Day 3 Part 2 Solution")
    func testDay03_part2_solution() {
        let day = Day03(input: Day03.input)
        #expect(day.part2() == 112272912)
    }
}
