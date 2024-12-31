//
// Advent of Code 2024 Day 19 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
r, wr, b, g, bwu, rb, gb, br

brwrr
bggr
gbbr
rrbgbr
ubwu
bwurrg
brgr
bbrgwb
"""

@Suite("Day 19 Tests")
struct Day19Tests {
    @Test("Day 19 Part 1", .tags(.testInput))
    func testDay19_part1() async {
        let day = Day19(input: testInput)
        #expect(await day.part1() == 6)
    }

    @Test("Day 19 Part 1 Solution")
    func testDay19_part1_solution() async {
        let day = Day19(input: Day19.input)
        #expect(await day.part1() == 236)
    }

    @Test("Day 19 Part 2", .tags(.testInput))
    func testDay19_part2() async {
        let day = Day19(input: testInput)
        #expect(await day.part2() == 16)
    }

    @Test("Day 19 Part 2 Solution")
    func testDay19_part2_solution() async {
        let day = Day19(input: Day19.input)
        #expect(await day.part2() == 643685981770598)
    }
}
