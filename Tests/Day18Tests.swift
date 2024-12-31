//
// Advent of Code 2024 Day 18 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
5,4
4,2
4,5
3,0
2,1
6,3
2,4
1,5
0,6
3,3
2,6
5,1
1,2
5,5
2,5
6,5
1,4
0,4
6,4
1,1
6,1
1,0
0,5
1,6
2,0
"""

@Suite("Day 18 Tests")
struct Day18Tests {
    @Test("Day 18 Part 1", .tags(.testInput))
    func testDay18_part1() async {
        let day = Day18(input: testInput)
        #expect(await day.part1(fallen: 12, gridSize: 6) == 22)
    }

    @Test("Day 18 Part 1 Solution")
    func testDay18_part1_solution() async {
        let day = Day18(input: Day18.input)
        #expect(await day.part1() == 348)
    }

    @Test("Day 18 Part 2", .tags(.testInput))
    func testDay18_part2() async {
        let day = Day18(input: testInput)
        #expect(await day.part2(fallen: 12, gridSize: 6) == "6,1")
    }

    @Test("Day 18 Part 2 Solution")
    func testDay18_part2_solution() async {
        let day = Day18(input: Day18.input)
        #expect(await day.part2() == "54,44")
    }
}
