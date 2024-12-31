//
// Advent of Code 2024 Day 12 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
AAAA
BBCD
BBCC
EEEC
"""

fileprivate let testInput2 = """
OOOOO
OXOXO
OOOOO
OXOXO
OOOOO
"""

fileprivate let testInput3 = """
RRRRIICCFF
RRRRIICCCF
VVRRRCCFFF
VVRCCCJFFF
VVVVCJJCFE
VVIVCCJJEE
VVIIICJJEE
MIIIIIJJEE
MIIISIJEEE
MMMISSJEEE
"""

fileprivate let testInput4 = """
EEEEE
EXXXX
EEEEE
EXXXX
EEEEE
"""

fileprivate let testInput5 = """
AAAAAA
AAABBA
AAABBA
ABBAAA
ABBAAA
AAAAAA
"""

@Suite("Day 12 Tests")
struct Day12Tests {
    @Test("Day 12 Part 1", .tags(.testInput))
    func testDay12_part1() async {
        var day = Day12(input: testInput)
        #expect(await day.part1() == 140)

        day = Day12(input: testInput2)
        #expect(await day.part1() == 772)

        day = Day12(input: testInput3)
        #expect(await day.part1() == 1930)
    }

    @Test("Day 12 Part 1 Solution")
    func testDay12_part1_solution() async {
        let day = Day12(input: Day12.input)
        #expect(await day.part1() == 1375574)
    }

    @Test("Day 12 Part 2", .tags(.testInput))
    func testDay12_part2() async {
        var day = Day12(input: testInput)
        #expect(await day.part2() == 80)

        day = Day12(input: testInput2)
        #expect(await day.part2() == 436)

        day = Day12(input: testInput3)
        #expect(await day.part2() == 1206)

        day = Day12(input: testInput4)
        #expect(await day.part2() == 236)

        day = Day12(input: testInput5)
        #expect(await day.part2() == 368)
    }

    @Test("Day 12 Part 2 Solution")
    func testDay12_part2_solution() async {
        let day = Day12(input: Day12.input)
        #expect(await day.part2() == 830566)
    }
}
