//
// Advent of Code 2024 Day 22 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
1
10
100
2024
"""

fileprivate let testInput2 = """
1
2
3
2024
"""

@Suite("Day 22 Tests")
struct Day22Tests {
    @Test("Day 22 Part 1", .tags(.testInput))
    func testDay22_part1() async {
        let day = Day22(input: testInput)
        #expect(await day.part1() == 37327623)
    }

    @Test("Day 22 Part 1 Solution")
    func testDay22_part1_solution() async {
        let day = Day22(input: Day22.input)
        #expect(await day.part1() == 20215960478)
    }

    @Test("Day 22 Part 2", .tags(.testInput))
    func testDay22_part2() async {
        let day = Day22(input: testInput2)
        #expect(await day.part2() == 23)
    }

    @Test("Day 22 Part 2 Solution")
    func testDay22_part2_solution() async {
        let day = Day22(input: Day22.input)
        #expect(await day.part2() == 2221)
    }
}
