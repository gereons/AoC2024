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
    @MainActor @Test("Day 18 Part 1")
    func testDay18_part1() {
        let day = Day18(input: testInput)
        #expect(day.part1(fallen: 12, gridSize: 6) == 22)
    }

    @MainActor @Test("Day 18 Part 1 Solution")
    func testDay18_part1_solution() {
        let day = Day18(input: Day18.input)
        #expect(day.part1() == 348)
    }

    @MainActor @Test("Day 18 Part 2")
    func testDay18_part2() {
        let day = Day18(input: testInput)
        #expect(day.part2(fallen: 12, gridSize: 6) == "6,1")
    }

    @MainActor @Test("Day 18 Part 2 Solution")
    func testDay18_part2_solution() {
        let day = Day18(input: Day18.input)
        #expect(day.part2() == "54,44")
    }
}
