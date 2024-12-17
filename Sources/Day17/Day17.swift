//
// Advent of Code 2024 Day 17
//
// https://adventofcode.com/2024/day/17
//

import AoCTools
import Foundation
import Collections

private final class ChronospatialComputer {
    let program: [Int]
    let initialRegisters: [Int]

    init(program: [Int], initialRegisters: [Int]) {
        self.program = program
        self.initialRegisters = initialRegisters
    }

    func run() -> [Int] {
        var output = [Int]()
        var instructionPointer = 0
        var registers = initialRegisters

        func combo(_ operand: Int) -> Int {
            switch operand {
            case 0...3: operand
            case 4...6: registers[operand - 4]
            default: fatalError()
            }
        }

        while instructionPointer < program.count {
            let opcode = program[instructionPointer]
            let operand = program[instructionPointer + 1]
            var nextInstruction = instructionPointer + 2

            switch opcode {
            case 0: // adv
                registers[0] /= pow(2, combo(operand))
            case 1: // bxl
                registers[1] ^= operand
            case 2: // bst
                registers[1] = combo(operand) % 8
            case 3: // jnz
                if registers[0] != 0 {
                    nextInstruction = operand
                }
            case 4: // bxc
                registers[1] ^= registers[2]
            case 5: // out
                output.append(combo(operand) % 8)
            case 6: // bdv
                registers[1] = registers[0] / pow(2, combo(operand))
            case 7: // cdv
                registers[2] = registers[0] / pow(2, combo(operand))
            default:
                fatalError()
            }
            instructionPointer = nextInstruction
        }

        return output
    }


    private func pow(_ x: Int, _ y: Int) -> Int {
        Int(Foundation.pow(Double(x), Double(y)))
    }
}

final class Day17: AOCDay {
    let title = "Chronospatial Computer"

    private let cpu: ChronospatialComputer

    init(input: String) {
        let lines = input.lines
        let regA = lines[0].allInts()[0]
        let regB = lines[1].allInts()[0]
        let regC = lines[2].allInts()[0]
        let program = lines[4].allInts()

        cpu = ChronospatialComputer(program: program, initialRegisters: [regA, regB, regC])
    }

    func part1() -> String {
        cpu.run()
            .map { "\($0)" }
            .joined(separator: ",")
    }

    func part2() -> Int {
        let expected = cpu.program

        var variants = Deque<(regA: Int, digits: Int)>()
        variants.append((regA: 0, digits: 1))

        while let (testA, digits) = variants.popFirst() {
            for i in 0...7 {
                let nextA = testA << 3 + i
                let cpu = ChronospatialComputer(program: cpu.program, initialRegisters: [nextA, 0, 0])
                let output = cpu.run()
                if output == expected.suffix(digits) {
                    if digits == expected.count {
                        return nextA
                    }
                    variants.append((regA: nextA, digits: digits + 1))
                }
            }
        }

        return -1
    }
}
