//
// Advent of Code 2024 Day 25
//
// https://adventofcode.com/2024/day/25
//

import AoCTools

final class Day25: AdventOfCodeDay {
    let title = "Code Chronicle"

    let grids: [[Point: Character]]

    init(input: String) {
        let groups = input.lines.grouped(by: \.isEmpty)

        var grids = [[Point: Character]]()
        for group in groups {
            let points = group
                .enumerated().flatMap { y, line in
                    line.enumerated().map { x, ch in
                        let p = Point(x, y)
                        return (p, ch)
                    }
                }
            let grid = Dictionary(points, uniquingKeysWith: { _, new in new })
            grids.append(grid)
        }
        self.grids = grids
    }

    func part1() async -> Int {
        let keys = grids.filter { $0[.zero] == "#" }.map { barHeights($0) }
        let locks = grids.filter { $0[.zero] == "." }.map { barHeights($0) }

        var count = 0
        for key in keys {
            for lock in locks {
                let match = (0..<5)
                    .map { key[$0] + lock[$0] }
                    .allSatisfy { $0 <= 5 }
                if match {
                    count += 1
                }
            }
        }
        return count
    }

    private func barHeights(_ grid: [Point: Character]) -> [Int] {
        (0..<5).map { x in
            let count = grid.count(where: { $0.key.x == x && $0.value == "#" })
            return count - 1
        }
    }

    func part2() async -> Int {
        0
    }
}
