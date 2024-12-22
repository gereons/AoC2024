//
// Advent of Code 2024 Day 15 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
########
#..O.O.#
##@.O..#
#...O..#
#.#.O..#
#...O..#
#......#
########

<^^>>>vv<v>>v<<
"""

fileprivate let testInput2 = """
##########
#..O..O.O#
#......O.#
#.OO..O.O#
#..O@..O.#
#O#..O...#
#O..O..O.#
#.OO.O.OO#
#....O...#
##########

<vv>^<v^>v>^vv^v>v<>v^v<v<^vv<<<^><<><>>v<vvv<>^v^>^<<<><<v<<<v^vv^v>^
vvv<<^>^v^^><<>>><>^<<><^vv^^<>vvv<>><^^v>^>vv<>v<<<<v<^v>^<^^>>>^<v<v
><>vv>v^v^<>><>>>><^^>vv>v<^^^>>v^v^<^^>v^^>v^<^v>v<>>v^v^<v>v^^<^^vv<
<<v<^>>^^^^>>>v^<>vvv^><v<<<>^^^vv^<vvv>^>v<^^^^v<>^>vvvv><>>v^<<^^^^^
^><^><>>><>^^<<^^v>>><^<v>^<vv>>v>>>^v><>^v><<<<v>>v<v<v>vvv>^<><<>^><
^>><>^v<><^vvv<^^<><v<<<<<><^v<<<><<<^^<v<^^^><^>>^<v^><<<^>>^v<v^v<v^
>^>>^v>vv>^<<^v<>><<><<v<<v><>v<^vv<<<>^^v^>^^>>><<^v>>v^v><^^>>^<>vv^
<><^^>^^^<><vvvvv^v<v<<>^v<v>v<<^><<><<><<<^^<<<^<<>><<><^^^>^^<>^>v<>
^^>vv<^v^v<vv>^<><v<^v>^^^>>>^^vvv^>vvv<>>>^<^>>>>>^<<^v>^vvv<>^<><<v>
v^^>>><<^^<>>^v^<v^vv<>v^<<>^<^v^v><^<<<><<^<v><v<>vv>>v><v^<vv<>v^<<^
"""

@Suite("Day 15 Tests")
struct Day15Tests {
    @MainActor @Test("Day 15 Part 1", .tags(.testInput))
    func testDay15_part1() {
        var day = Day15(input: testInput)
        #expect(day.part1() == 2028)

        day = Day15(input: testInput2)
        #expect(day.part1() == 10092)
    }

    @MainActor @Test("Day 15 Part 1 Solution")
    func testDay15_part1_solution() {
        let day = Day15(input: Day15.input)
        #expect(day.part1() == 1476771)
    }

    @MainActor @Test("Day 15 Part 2", .tags(.testInput))
    func testDay15_part2() {
        let day = Day15(input: testInput2)
        #expect(day.part2() == 9021)
    }

    @MainActor @Test("Day 15 Part 2 Solution")
    func testDay15_part2_solution() {
        let day = Day15(input: Day15.input)
        #expect(day.part2() == 1468005)
    }
}
