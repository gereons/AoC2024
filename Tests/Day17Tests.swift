//
// Advent of Code 2024 Day 17 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
Register A: 729
Register B: 0
Register C: 0

Program: 0,1,5,4,3,0
"""

fileprivate let testInput2 = """
Register A: 2024
Register B: 0
Register C: 0

Program: 0,3,5,4,3,0
"""

@Suite("Day 17 Tests")
struct Day17Tests {
    @Test("Day 17 Part 1", .tags(.testInput))
    func testDay17_part1() async {
        let day = Day17(input: testInput)
        #expect(await day.part1() == "4,6,3,5,6,3,5,2,1,0")
    }

    @Test("Day 17 Part 1 Solution")
    func testDay17_part1_solution() async {
        let day = Day17(input: Day17.input)
        #expect(await day.part1() == "5,1,4,0,5,1,0,2,6")
    }

    @Test("Day 17 Part 2", .tags(.testInput))
    func testDay17_part2() async {
        let day = Day17(input: testInput2)
        #expect(await day.part2() == 117440)
    }

    @Test("Day 17 Part 2 Solution")
    func testDay17_part2_solution() async {
        let day = Day17(input: Day17.input)
        #expect(await day.part2() == 202322936867370)
    }
}
