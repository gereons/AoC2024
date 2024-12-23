//
// Advent of Code 2024 Day 23 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
kh-tc
qp-kh
de-cg
ka-co
yn-aq
qp-ub
cg-tb
vc-aq
tb-ka
wh-tc
yn-cg
kh-ub
ta-co
de-co
tc-td
tb-wq
wh-td
ta-ka
td-qp
aq-cg
wq-ub
ub-vc
de-ta
wq-aq
wq-vc
wh-yn
ka-de
kh-ta
co-tc
wh-qp
tb-vc
td-yn
"""

@Suite("Day 23 Tests")
struct Day23Tests {
    @MainActor @Test("Day 23 Part 1", .tags(.testInput))
    func testDay23_part1() {
        let day = Day23(input: testInput)
        #expect(day.part1() == 7)
    }

    @MainActor @Test("Day 23 Part 1 Solution")
    func testDay23_part1_solution() {
        let day = Day23(input: Day23.input)
        #expect(day.part1() == 1173)
    }

    @MainActor @Test("Day 23 Part 2", .tags(.testInput))
    func testDay23_part2() {
        let day = Day23(input: testInput)
        #expect(day.part2() == 0)
    }

    @MainActor @Test("Day 23 Part 2 Solution")
    func testDay23_part2_solution() {
        let day = Day23(input: Day23.input)
        #expect(day.part2() == 0)
    }
}
