//
// Advent of Code 2024 Day 11 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
125 17
"""

@Suite("Day 11 Tests")
struct Day11Tests {
    @Test("Day 11 Part 1", .tags(.testInput))
    func testDay11_part1() async {
        let day = Day11(input: testInput)
        #expect(await day.part1() == 55312)
    }

    @Test("Day 11 Part 1 Solution")
    func testDay11_part1_solution() async {
        let day = Day11(input: Day11.input)
        #expect(await day.part1() == 198089)
    }

    @Test("Day 11 Part 2 Solution")
    func testDay11_part2_solution() async {
        let day = Day11(input: Day11.input)
        #expect(await day.part2() == 236302670835517)
    }
}
