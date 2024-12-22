//
// Advent of Code 2024 Day 6 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...
"""

@Suite("Day 6 Tests")
struct Day06Tests {
    @MainActor @Test("Day 6 Part 1", .tags(.testInput))
    func testDay06_part1() {
        let day = Day06(input: testInput)
        #expect(day.part1() == 41)
    }

    @MainActor @Test("Day 6 Part 1 Solution")
    func testDay06_part1_solution() {
        let day = Day06(input: Day06.input)
        #expect(day.part1() == 4903)
    }

    @MainActor @Test("Day 6 Part 2", .tags(.testInput))
    func testDay06_part2() {
        let day = Day06(input: testInput)
        #expect(day.part2() == 6)
    }

    @MainActor @Test("Day 6 Part 2 Solution")
    func testDay06_part2_solution() {
        let day = Day06(input: Day06.input)
        #expect(day.part2() == 1911)
    }
}
