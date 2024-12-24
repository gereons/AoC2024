//
// Advent of Code 2024 Day 24 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
x00: 1
x01: 1
x02: 1
y00: 0
y01: 1
y02: 0

x00 AND y00 -> z00
x01 XOR y01 -> z01
x02 OR y02 -> z02
"""

fileprivate let testInput2 = """
x00: 1
x01: 0
x02: 1
x03: 1
x04: 0
y00: 1
y01: 1
y02: 1
y03: 1
y04: 1

ntg XOR fgs -> mjb
y02 OR x01 -> tnw
kwq OR kpj -> z05
x00 OR x03 -> fst
tgd XOR rvg -> z01
vdt OR tnw -> bfw
bfw AND frj -> z10
ffh OR nrd -> bqk
y00 AND y03 -> djm
y03 OR y00 -> psh
bqk OR frj -> z08
tnw OR fst -> frj
gnj AND tgd -> z11
bfw XOR mjb -> z00
x03 OR x00 -> vdt
gnj AND wpb -> z02
x04 AND y00 -> kjc
djm OR pbm -> qhw
nrd AND vdt -> hwm
kjc AND fst -> rvg
y04 OR y02 -> fgs
y01 AND x02 -> pbm
ntg OR kjc -> kwq
psh XOR fgs -> tgd
qhw XOR tgd -> z09
pbm OR djm -> kpj
x03 XOR y03 -> ffh
x00 XOR y04 -> ntg
bfw OR bqk -> z06
nrd XOR fgs -> wpb
frj XOR qhw -> z04
bqk OR frj -> z07
y03 OR x01 -> nrd
hwm AND bqk -> z03
tgd XOR rvg -> z12
tnw OR pbm -> gnj
"""

@Suite("Day 24 Tests")
struct Day24Tests {
    @MainActor @Test("Day 24 Part 1", .tags(.testInput))
    func testDay24_part1() {
        var day = Day24(input: testInput)
        #expect(day.part1() == 4)

        day = Day24(input: testInput2)
        #expect(day.part1() == 2024)
    }

    @MainActor @Test("Day 24 Part 1 Solution")
    func testDay24_part1_solution() {
        let day = Day24(input: Day24.input)
        #expect(day.part1() == 51715173446832)
    }

    @MainActor @Test("Day 24 Part 2 Solution")
    func testDay24_part2_solution() {
        let day = Day24(input: Day24.input)
        #expect(day.part2() == "dpg,kmb,mmf,tvp,vdk,z10,z15,z25")
    }
}
