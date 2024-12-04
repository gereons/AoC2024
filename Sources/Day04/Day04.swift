//
// Advent of Code 2024 Day 4
//
// https://adventofcode.com/2024/day/4
//

import AoCTools

final class Day04: AOCDay {
    let title = "Ceres Search"
    let grid: [Point: Character]

    init(input: String) {
        let points = input
            .lines
            .enumerated().flatMap { y, line in
                line.enumerated().map { x, ch in
                    let p = Point(x, y)
                    return (p, ch)
                }
            }
        grid = Dictionary(points, uniquingKeysWith: { _, new in new } )
    }

    func part1() -> Int {
        grid.keys
            .map {
                findXMAS(at: $0)
            }
            .reduce(0, +)
    }

    private func findXMAS(at p: Point) -> Int {
        guard ["X", "S"].contains(grid[p]) else { return 0 }

        let directions: [Direction] = [.w, .sw, .s, .se]
        let sets = directions.map { dir in
            (0...3).map { steps in
                p.moved(to: dir, steps: steps)
            }
        }

        let search: [Character] = ["X", "M", "A", "S"]
        let searchRev = Array(search.reversed())

        return sets
            .filter { set in
                let cmp = set.map {
                    grid[$0, default: " "]
                }
                return cmp == search || cmp == searchRev
            }
            .count
    }

    func part2() -> Int {
        grid.keys
            .filter {
                findX_MAS(at: $0)
            }
            .count
    }

    private func findX_MAS(at p: Point) -> Bool {
        guard grid[p] == "A" else { return false }

        let sets = [
            [p.moved(to: .nw), p, p.moved(to: .se)],
            [p.moved(to: .sw), p, p.moved(to: .ne)]
        ]

        let search: [Character] = ["M", "A", "S"]
        let searchRev = Array(search.reversed())

        return sets.allSatisfy { set in
            let cmp = set.map {
                grid[$0, default: " "]
            }
            return cmp == search || cmp == searchRev
        }
    }
}
