//
// Advent of Code 2024 Day 24 Tests
//

import Testing
@testable import AdventOfCode

@Suite("Day 24 Tests")
struct Day24Tests {
    @Test("Day 24 Part 1 Solution")
    func testDay24_part1_solution() async {
        let day = Day24(input: Day24.input)
        #expect(await day.part1() == 51715173446832)
    }

    @Test("Day 24 Part 2 Solution")
    func testDay24_part2_solution() async {
        let day = Day24(input: Day24.input)
        #expect(await day.part2() == "dpg,kmb,mmf,tvp,vdk,z10,z15,z25")
    }
}
