//
// Advent of Code 2024 Day 20 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
###############
#...#...#.....#
#.#.#.#.#.###.#
#S#...#.#.#...#
#######.#.#.###
#######.#.#...#
#######.#.###.#
###..E#...#...#
###.#######.###
#...###...#...#
#.#####.#.###.#
#.#...#.#.#...#
#.#.#.#.#.#.###
#...#...#...###
###############
"""

@Suite("Day 20 Tests")
struct Day20Tests {
    @MainActor @Test("Day 20 Part 1", .tags(.testInput))
    func testDay20_part1() {
        let day = Day20(input: testInput)
        #expect(day.part1(minTimeSaved: 0) == 44)
    }

    @MainActor @Test("Day 20 Part 1 Solution")
    func testDay20_part1_solution() {
        let day = Day20(input: Day20.input)
        #expect(day.part1() == 1327)
    }

    @MainActor @Test("Day 20 Part 2", .tags(.testInput))
    func testDay20_part2() {
        let day = Day20(input: testInput)
        #expect(day.part2(minTimeSaved: 50) == 285)
    }

    @MainActor @Test("Day 20 Part 2 Solution")
    func testDay20_part2_solution() {
        let day = Day20(input: Day20.input)
        #expect(day.part2() == 985737)
    }
}
