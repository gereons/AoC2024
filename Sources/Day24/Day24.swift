//
// Advent of Code 2024 Day 24
//
// https://adventofcode.com/2024/day/24
//

import AoCTools

struct Gate {
    let input1: String
    let input2: String
    let op: Operation
    let output: String

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

final class Day24: AOCDay {
    let title = "Crossed Wires"

    let inputs: [String: Int]
    let gates: [Gate]

    init(input: String) {
        let parts = input.lines.grouped(by: \.isEmpty)

        let wires = parts[0].map {
            let parts = $0.split(separator: ": ")
            return (String(parts[0]), Int(parts[1])!)
        }
        self.inputs = Dictionary(uniqueKeysWithValues: wires)

        gates = parts[1].map { Gate(from: $0) }
    }

    func part1() -> Int {
        let outputs = gates.map { $0.output }.filter { $0.hasPrefix("z") }

        var results = [String: Int]()
        for output in outputs {
            let value = findValue(output)
            results[output] = value
        }

        let bits = results
            .sorted { $0.key > $1.key }
            .map { String($0.value) }
            .joined()

        return Int(bits, radix: 2)!
    }

    private lazy var findValue = Memoized<String, Int> { [unowned self] output, recurse in
        let instruction = gates.first { $0.output == output }!

        let value1 = inputs[instruction.input1] ?? recurse(instruction.input1)
        let value2 = inputs[instruction.input2] ?? recurse(instruction.input2)
        switch instruction.op {
        case .and: return value1 & value2
        case .or: return value1 | value2
        case .xor: return value1 ^ value2
        }
    }

    func part2() -> Int {
        0
    }
}

public final class Memoized<In: Hashable, Out> {
    private var _compute: (In, Memoized) -> Out

    public init(_ compute: @escaping (In, Memoized) -> Out) {
        _compute = { _, _ in fatalError() }

        unowned let me = self
        var cache: [In: Out] = [:]
        _compute = { input, _ in
            if let answer = cache[input] {
                return answer
            }
            let answer = compute(input, me)
            cache[input] = answer
            return answer
        }
    }

    public func callAsFunction(_ input: In) -> Out { _compute(input, self) }
}
