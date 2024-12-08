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
    @MainActor @Test("Day 8 Part 1")
    func testDay08_part1() {
        let day = Day08(input: testInput)
        #expect(day.part1() == 14)
    }

    @MainActor @Test("Day 8 Part 1 Solution")
    func testDay08_part1_solution() {
        let day = Day08(input: Day08.input)
        #expect(day.part1() == 376)
    }

    @MainActor @Test("Day 8 Part 2")
    func testDay08_part2() {
        let day = Day08(input: testInput)
        #expect(day.part2() == 34)
    }

    @MainActor @Test("Day 8 Part 2 Solution")
    func testDay08_part2_solution() {
        let day = Day08(input: Day08.input)
        #expect(day.part2() == 1352)
    }
}
