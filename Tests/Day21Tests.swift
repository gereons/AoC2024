//
// Advent of Code 2024 Day 21 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
029A
980A
179A
456A
379A
"""

@Suite("Day 21 Tests")
struct Day21Tests {
    @Test("Day 21 Part 1", .tags(.testInput))
    func testDay21_part1() async {
        let day = Day21(input: testInput)
        #expect(await day.part1() == 126384)
    }

    @Test("Day 21 Part 1 Solution")
    func testDay21_part1_solution() async {
        let day = Day21(input: Day21.input)
        #expect(await day.part1() == 123096)
    }

    @Test("Day 21 Part 2", .tags(.testInput))
    func testDay21_part2() async {
        let day = Day21(input: testInput)
        #expect(await day.part2() == 154115708116294)
    }

    @Test("Day 21 Part 2 Solution")
    func testDay21_part2_solution() async {
        let day = Day21(input: Day21.input)
        #expect(await day.part2() == 154517692795352)
    }
}
