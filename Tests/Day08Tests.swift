//
// Advent of Code 2024 Day 8 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............
"""

@Suite("Day 8 Tests")
struct Day08Tests {
    @Test("Day 8 Part 1", .tags(.testInput))
    func testDay08_part1() async {
        let day = Day08(input: testInput)
        #expect(await day.part1() == 14)
    }

    @Test("Day 8 Part 1 Solution")
    func testDay08_part1_solution() async {
        let day = Day08(input: Day08.input)
        #expect(await day.part1() == 376)
    }

    @Test("Day 8 Part 2", .tags(.testInput))
    func testDay08_part2() async {
        let day = Day08(input: testInput)
        #expect(await day.part2() == 34)
    }

    @Test("Day 8 Part 2 Solution")
    func testDay08_part2_solution() async {
        let day = Day08(input: Day08.input)
        #expect(await day.part2() == 1352)
    }
}
