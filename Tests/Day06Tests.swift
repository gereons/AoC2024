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
    @Test("Day 6 Part 1", .tags(.testInput))
    func testDay06_part1() async {
        let day = Day06(input: testInput)
        #expect(await day.part1() == 41)
    }

    @Test("Day 6 Part 1 Solution")
    func testDay06_part1_solution() async {
        let day = Day06(input: Day06.input)
        #expect(await day.part1() == 4903)
    }

    @Test("Day 6 Part 2", .tags(.testInput))
    func testDay06_part2() async {
        let day = Day06(input: testInput)
        #expect(await day.part2() == 6)
    }

    @Test("Day 6 Part 2 Solution")
    func testDay06_part2_solution() async {
        let day = Day06(input: Day06.input)
        #expect(await day.part2() == 1911)
    }
}
