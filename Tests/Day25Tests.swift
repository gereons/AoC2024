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
    @MainActor @Test("Day 25 Part 1", .tags(.testInput))
    func testDay25_part1() {
        let day = Day25(input: testInput)
        #expect(day.part1() == 3)
    }

    @MainActor @Test("Day 25 Part 1 Solution")
    func testDay25_part1_solution() {
        let day = Day25(input: Day25.input)
        #expect(day.part1() == 2824)
    }
}
