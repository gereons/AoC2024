//
// Advent of Code 2024 Day 24
//
// https://adventofcode.com/2024/day/24
//

import AoCTools

private struct Gate {
    let input1: String
    let input2: String
    let op: Operation
    let output: String

    var inputs: [String] { [input1, input2] }

    enum Operation: String {
        case and = "AND"
        case or = "OR"
        case xor = "XOR"
    }

    init(from str: String) {
        let parts = str.components(separatedBy: " ")
        input1 = parts[0]
        op = Operation(rawValue: parts[1])!
        input2 = parts[2]
        output = parts[4]
    }
}

final class Day24: AdventOfCodeDay {
    let title = "Crossed Wires"

    let inputs: [String: Int]
    private let gates: [String: Gate]
    let inputBits: Int

    init(input: String) {
        let parts = input.lines.grouped(by: \.isEmpty)

        let wires = parts[0].map {
            let parts = $0.split(separator: ": ")
            return (String(parts[0]), Int(parts[1])!)
        }
        self.inputs = Dictionary(uniqueKeysWithValues: wires)

        let gates = parts[1].map { Gate(from: $0) }
        self.gates = gates.mapped(by: \.output)

        self.inputBits = inputs.count / 2
    }

    func part1() async -> Int {
        let adder = Adder(gates: self.gates, inputBits: inputBits)
        return adder.add(inputs: inputs)
    }

    func part2() async -> String {
        var gates = self.gates
        var swaps = [String]()
        for bits in 0 ..< inputBits {
            if testBits(gates: gates, bits: bits) {
                continue
            }

            // find gates that are used to get this output bit and try swapping any pair of those
            let output = "z\(String(format: "%02d", bits + 1))"
            var swapCandidates = gatesUsedToCalculate(output, gates: gates)
            for z in 0 ... bits {
                swapCandidates.insert("z\(String(format: "%02d", z))")
            }
            let swapped = findSwaps(gates: &gates, bits: bits + 1, swappable: swapCandidates)

            swaps.append(swapped.0)
            swaps.append(swapped.1)
        }

        return swaps
            .sorted()
            .joined(separator: ",")
    }

    private func findSwaps(gates: inout [String: Gate], bits: Int, swappable: Set<String>) -> (String, String) {
        let keys = swappable.sorted()
        for g1 in keys {
            for g2 in keys {
                if g2 <= g1 {
                    continue
                }

                var tmp = gates[g1]!
                gates[g1] = gates[g2]!
                gates[g2] = tmp

                if testBits(gates: gates, bits: bits) {
                    return (g1, g2)
                }

                tmp = gates[g1]!
                gates[g1] = gates[g2]!
                gates[g2] = tmp
            }
        }
        fatalError()
    }

    private func testBits(gates: [String: Gate], bits: Int) -> Bool {
        for _ in 0...20 {
            let x = Int.random(in: 0...pow(2, bits))
            let y = Int.random(in: 0...pow(2, bits))
            if !testAddition(gates: gates, x: x, y: y) {
                return false
            }
        }
        return true
    }

    private func testAddition(gates: [String: Gate], x: Int, y: Int) -> Bool {
        let adder = Adder(gates: gates, inputBits: inputBits)
        let result = adder.add(x: x, y: y, expectedResult: x + y)
        return x + y == result
    }

    private func gatesUsedToCalculate(_ output: String, gates: [String: Gate]) -> Set<String> {
        let producers = gates.values.filter({ $0.output == output })
        if producers.isEmpty {
            return []
        } else {
            var set = Set<String>()
            for gate in producers {
                for input in gate.inputs {
                    if !["x", "y"].contains(input.prefix(1)) {
                        set.insert(input)
                    }
                    set.formUnion(gatesUsedToCalculate(input, gates: gates))
                }
            }
            return set
        }
    }
}

private struct Adder {
    let gates: [String: Gate]
    let inputBits: Int

    func add(x: Int, y: Int, expectedResult: Int? = nil) -> Int {
        var inputs = [String: Int]()
        for bit in 0 ..< inputBits {
            inputs["x\(String(format: "%02d", bit))"] = x >> bit & 1
            inputs["y\(String(format: "%02d", bit))"] = y >> bit & 1
        }

        var expectedOutputs = [String: Int]()
        if let expectedResult {
            for bit in 0 ..< inputBits + 1 {
                expectedOutputs["z\(String(format: "%02d", bit))"] = expectedResult >> bit & 1
            }
        }
        return add(inputs: inputs, expectedOutputs: expectedOutputs)
    }

    func add(inputs: [String: Int], expectedOutputs: [String: Int] = [:]) -> Int {
        if let results = findZBits(in: gates, inputs: inputs, expectedOutputs: expectedOutputs), results.count == inputBits + 1 {
            let bits = results
                .sorted { $0.key > $1.key }
                .map { String($0.value) }
                .joined()

            return Int(bits, radix: 2)!
        }
        return -1
    }

    private func findZBits(
        in gates: [String: Gate],
        inputs: [String: Int],
        expectedOutputs: [String: Int]
    ) -> [String: Int]? {
        var done = false
        var values = inputs
        while !done {
            done = true

            for out in gates.keys {
                if values[out] != nil {
                    continue
                }

                let op = gates[out]!
                if let i1 = values[op.input1], let i2 = values[op.input2] {
                    let value = switch op.op {
                        case .and: i1 & i2
                        case .or: i1 | i2
                        case .xor: i1 ^ i2
                        }
                    values[out] = value
                    if out.prefix(1) == "z" && !expectedOutputs.isEmpty && expectedOutputs[out] != value {
                        return nil
                    }
                    done = false
                }
            }
        }

        return values.filter { $0.key.hasPrefix("z") }
    }
}
