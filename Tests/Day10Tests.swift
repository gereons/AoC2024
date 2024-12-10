//
// Advent of Code 2024 Day 10 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
89010123
78121874
87430965
96549874
45678903
32019012
01329801
10456732
"""

fileprivate let testInput2 = """
.....0.
..4321.
..5..2.
..6543.
..7..4.
..8765.
..9....
"""

fileprivate let testInput3 = """
012345
123456
234567
345678
4.6789
56789.
"""

@Suite("Day 10 Tests")
struct Day10Tests {
    @MainActor @Test("Day 10 Part 1")
    func testDay10_part1() {
        let day = Day10(input: testInput)
        #expect(day.part1() == 36)
    }

    @MainActor @Test("Day 10 Part 1 Solution")
    func testDay10_part1_solution() {
        let day = Day10(input: Day10.input)
        #expect(day.part1() == 501)
    }

    @MainActor @Test("Day 10 Part 2")
    func testDay10_part2() {
        var day = Day10(input: testInput)
        #expect(day.part2() == 81)

        day = Day10(input: testInput2)
        #expect(day.part2() == 3)

        day = Day10(input: testInput3)
        #expect(day.part2() == 227)
    }

    @MainActor @Test("Day 10 Part 2 Solution")
    func testDay10_part2_solution() {
        let day = Day10(input: Day10.input)
        #expect(day.part2() == 1017)
    }
}
