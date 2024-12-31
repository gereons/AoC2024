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
    @Test("Day 1 Part 1", .tags(.testInput))
    func testDay01_part1() async {
        let day = Day01(input: testInput)
        #expect(await day.part1() == 11)
    }

    @Test("Day 1 Part 1 Solution")
    func testDay01_part1_solution() async {
        let day = Day01(input: Day01.input)
        #expect(await day.part1() == 1341714)
    }

    @Test("Day 1 Part 2", .tags(.testInput))
    func testDay01_part2() async {
        let day = Day01(input: testInput)
        #expect(await day.part2() == 31)
    }

    @Test("Day 1 Part 2 Solution")
    func testDay01_part2_solution() async {
        let day = Day01(input: Day01.input)
        #expect(await day.part2() == 27384707)
    }
}
