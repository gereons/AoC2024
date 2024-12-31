//
// Advent of Code 2024 Day 16 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
###############
#.......#....E#
#.#.###.#.###.#
#.....#.#...#.#
#.###.#####.#.#
#.#.#.......#.#
#.#.#####.###.#
#...........#.#
###.#.#####.#.#
#...#.....#.#.#
#.#.#.###.#.#.#
#.....#...#.#.#
#.###.#.#.#.#.#
#S..#.....#...#
###############
"""

fileprivate let testInput2 = """
#################
#...#...#...#..E#
#.#.#.#.#.#.#.#.#
#.#.#.#...#...#.#
#.#.#.#.###.#.#.#
#...#.#.#.....#.#
#.#.#.#.#.#####.#
#.#...#.#.#.....#
#.#.#####.#.###.#
#.#.#.......#...#
#.#.###.#####.###
#.#.#...#.....#.#
#.#.#.#####.###.#
#.#.#.........#.#
#.#.#.#########.#
#S#.............#
#################
"""

@Suite("Day 16 Tests")
struct Day16Tests {
    @Test("Day 16 Part 1", .tags(.testInput))
    func testDay16_part1() async {
        var day = Day16(input: testInput)
        #expect(await day.part1() == 7036)

        day = Day16(input: testInput2)
        #expect(await day.part1() == 11048)
    }

    @Test("Day 16 Part 1 Solution")
    func testDay16_part1_solution() async {
        let day = Day16(input: Day16.input)
        #expect(await day.part1() == 111480)
    }

    @Test("Day 16 Part 2", .tags(.testInput))
    func testDay16_part2() async {
        var day = Day16(input: testInput)
        #expect(await day.part2() == 45)

        day = Day16(input: testInput2)
        #expect(await day.part2() == 64)
    }

    @Test("Day 16 Part 2 Solution")
    func testDay16_part2_solution() async {
        let day = Day16(input: Day16.input)
        #expect(await day.part2() == 529)
    }
}
