//
// Advent of Code 2024 Day 14 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
p=0,4 v=3,-3
p=6,3 v=-1,-3
p=10,3 v=-1,2
p=2,0 v=2,-1
p=0,0 v=1,3
p=3,0 v=-2,-2
p=7,6 v=-1,-3
p=3,0 v=-1,-2
p=9,3 v=2,3
p=7,3 v=-1,2
p=2,4 v=2,-3
p=9,5 v=-3,-3
"""

@Suite("Day 14 Tests")
struct Day14Tests {
    @Test("Day 14 Part 1", .tags(.testInput))
    func testDay14_part1() async {
        let day = Day14(input: testInput, width: 11, height: 7)
        #expect(await day.part1() == 12)
    }

    @Test("Day 14 Part 1 Solution")
    func testDay14_part1_solution() async {
        let day = Day14(input: Day14.input)
        #expect(await day.part1() == 208437768)
    }

    @Test("Day 14 Part 2 Solution")
    func testDay14_part2_solution() async {
        let day = Day14(input: Day14.input)
        #expect(await day.part2() == 7492)
    }
}
