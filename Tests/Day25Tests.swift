//
// Advent of Code 2024 Day 25 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
#####
.####
.####
.####
.#.#.
.#...
.....

#####
##.##
.#.##
...##
...#.
...#.
.....

.....
#....
#....
#...#
#.#.#
#.###
#####

.....
.....
#.#..
###..
###.#
###.#
#####

.....
.....
.....
#....
#.#..
#.#.#
#####
"""

@Suite("Day 25 Tests")
struct Day25Tests {
    @Test("Day 25 Part 1", .tags(.testInput))
    func testDay25_part1() async {
        let day = Day25(input: testInput)
        #expect(await day.part1() == 3)
    }

    @Test("Day 25 Part 1 Solution")
    func testDay25_part1_solution() async {
        let day = Day25(input: Day25.input)
        #expect(await day.part1() == 2824)
    }
}
