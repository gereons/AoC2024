//
// Advent of Code 2024 Day 21
//
// https://adventofcode.com/2024/day/21
//

import AoCTools

extension Pair: @retroactive @unchecked Sendable where T: Sendable, U: Sendable {}

final class Day21: AdventOfCodeDay, @unchecked Sendable {
    let title = "Keypad Conundrum"

    let codes: [String]
    typealias KeyPair = Pair<Character, Character>
    let numPadSteps: [KeyPair: [String]]
    let dPadSteps: [KeyPair: [String]]

    init(input: String) {
        codes = input.lines

        let numberKeys = """
        789
        456
        123
        X0A
        """
        self.numPadSteps = Self.generateSteps(str: numberKeys)

        let dPadKeys = """
        X^A
        <v>
        """
        self.dPadSteps = Self.generateSteps(str: dPadKeys)
    }

    struct State: Hashable {
        let prevChar: Character
        let thisChar: Character
        let levels: Int
    }

    private var cache = [State: Int]()

    func part1() async -> Int {
        solve(levels: 3)
    }

    func part2() async -> Int {
        solve(levels: 26)
    }

    private func solve(levels: Int) -> Int {
        var sum = 0
        for code in codes {
            var value = 0
            var prevChar: Character = "A"
            for c in code {
                value += numberOfKeyPresses(
                    map: numPadSteps,
                    state: State(prevChar: prevChar, thisChar: c, levels: levels)
                )
                prevChar = c
            }
            let complexity = value * Int(code.replacingOccurrences(of: "A", with: ""))!
            sum += complexity
        }
        return sum
    }

    private func numberOfKeyPresses(map: [KeyPair: [String]], state: State) -> Int {
        if let result = cache[state] {
            return result
        }

        if state.levels == 0 {
            return 1
        }

        var best = Int.max
        for steps in map[KeyPair(state.prevChar, state.thisChar)]! {
            var value = 0
            var prevChar: Character = "A"
            for c in steps {
                value += numberOfKeyPresses(
                    map: dPadSteps,
                    state: State(prevChar: prevChar, thisChar: c, levels: state.levels - 1)
                )
                prevChar = c
            }
            if value < best {
                best = value
            }
        }
        cache[state] = best
        return best
    }

    static func generateSteps(str: String) -> [KeyPair: [String]] {
        let chars = str.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "X", with: "")
        let grid = Grid<Character>.parse(str)
        var steps = [KeyPair: [String]]()
        for start in chars {
            for end in chars {
                steps[KeyPair(start, end)] = generateSteps(map: grid.points, start: start, end: end)
            }
        }
        return steps
    }

    static func generateSteps(map: [Point: Character], start: Character, end: Character, visited: Set<Character> = []) -> [String] {
        if start == end { return ["A"] }

        let startPoint = map.first { $0.value == start }!.key
        var results = [String]()
        for dir in Direction.orthogonal {
            guard let nextChar = map[startPoint + dir] else { continue }
            if nextChar != "X" && !visited.contains(nextChar) {
                let nextSteps = generateSteps(map: map, start: nextChar, end: end, visited: visited + start)
                results.append(contentsOf: nextSteps.map { dir.description + $0 })
            }
        }
        return results
    }
}
