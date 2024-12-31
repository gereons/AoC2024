//
// Advent of Code 2024 Day 3
//
// https://adventofcode.com/2024/day/3
//

import AoCTools
import RegexBuilder

final class Day03: AdventOfCodeDay {
    let title = "Mull It Over"
    let lines: [String]

    init(input: String) {
        lines = input.lines
    }

    func part1() async -> Int {
        let x = Reference(Int.self)
        let y = Reference(Int.self)
        let regex = Regex {
            "mul("
            Capture(as: x) {
                Repeat(1...3) {
                    One(.digit)
                }
            } transform: { Int($0)! }
            ","
            Capture(as: y) {
                Repeat(1...3) {
                    One(.digit)
                }
            } transform: { Int($0)! }
            ")"
        }

        return lines
            .flatMap { line in
                line.matches(of: regex).map {
                    ($0[x], $0[y])
                }
            }
            .map { $0.0 * $0.1 }
            .reduce(0, +)
    }

    func part2() async -> Int {
        let x = Reference(Int.self)
        let y = Reference(Int.self)
        let regex = Regex {
            ChoiceOf {
                Regex {
                    "mul("
                    Capture(as: x) {
                        Repeat(1...3) {
                            One(.digit)
                        }
                    } transform: { Int($0)! }
                    ","
                    Capture(as: y) {
                        Repeat(1...3) {
                            One(.digit)
                        }
                    } transform: { Int($0)! }
                    ")"
                }
                "do()"
                "don't()"
            }
        }

        var ignore = false
        return lines
            .flatMap { line in
                line.matches(of: regex).compactMap { (match) -> (Int, Int)? in
                    switch match.output.0 {
                    case "do()":
                        ignore = false
                        return nil
                    case "don't()":
                        ignore = true
                        return nil
                    default:
                        return ignore ? nil : (match[x], match[y])
                    }
                }
            }
            .map { $0.0 * $0.1 }
            .reduce(0, +)
    }
}
