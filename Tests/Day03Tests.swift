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
    @Test("Day 3 Part 1", .tags(.testInput))
    func testDay03_part1() async {
        let day = Day03(input: testInput)
        #expect(await day.part1() == 161)
    }

    @Test("Day 3 Part 1 Solution")
    func testDay03_part1_solution() async {
        let day = Day03(input: Day03.input)
        #expect(await day.part1() == 175015740)
    }

    @Test("Day 3 Part 2", .tags(.testInput))
    func testDay03_part2() async {
        let day = Day03(input: testInput2)
        #expect(await day.part2() == 48)
    }

    @Test("Day 3 Part 2 Solution")
    func testDay03_part2_solution() async {
        let day = Day03(input: Day03.input)
        #expect(await day.part2() == 112272912)
    }
}
