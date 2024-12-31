//
// Advent of Code 2024 Day 13 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
Button A: X+94, Y+34
Button B: X+22, Y+67
Prize: X=8400, Y=5400

Button A: X+26, Y+66
Button B: X+67, Y+21
Prize: X=12748, Y=12176

Button A: X+17, Y+86
Button B: X+84, Y+37
Prize: X=7870, Y=6450

Button A: X+69, Y+23
Button B: X+27, Y+71
Prize: X=18641, Y=10279
"""

@Suite("Day 13 Tests")
struct Day13Tests {
    @Test("Day 13 Part 1", .tags(.testInput))
    func testDay13_part1() async {
        let day = Day13(input: testInput)
        #expect(await day.part1() == 480)
    }

    @Test("Day 13 Part 1 Solution")
    func testDay13_part1_solution() async {
        let day = Day13(input: Day13.input)
        #expect(await day.part1() == 26810)
    }

    @Test("Day 13 Part 2", .tags(.testInput))
    func testDay13_part2() async {
        let day = Day13(input: testInput)
        #expect(await day.part2() == 875318608908)
    }

    @Test("Day 13 Part 2 Solution")
    func testDay13_part2_solution() async {
        let day = Day13(input: Day13.input)
        #expect(await day.part2() == 108713182988244)
    }
}
