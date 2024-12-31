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
    @Test("Day 15 Part 1", .tags(.testInput))
    func testDay15_part1() async {
        var day = Day15(input: testInput)
        #expect(await day.part1() == 2028)

        day = Day15(input: testInput2)
        #expect(await day.part1() == 10092)
    }

    @Test("Day 15 Part 1 Solution")
    func testDay15_part1_solution() async {
        let day = Day15(input: Day15.input)
        #expect(await day.part1() == 1476771)
    }

    @Test("Day 15 Part 2", .tags(.testInput))
    func testDay15_part2() async {
        let day = Day15(input: testInput2)
        #expect(await day.part2() == 9021)
    }

    @Test("Day 15 Part 2 Solution")
    func testDay15_part2_solution() async {
        let day = Day15(input: Day15.input)
        #expect(await day.part2() == 1468005)
    }
}
