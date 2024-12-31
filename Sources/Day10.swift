//
// Advent of Code 2024 Day 10
//
// https://adventofcode.com/2024/day/10
//

import AoCTools
import Collections

final class Day10: AdventOfCodeDay {
    let title = "Hoof It"

    let grid: [Point: Int]

    init(input: String) {
        let lines = input.lines
        let points = lines
            .enumerated().flatMap { y, line in
                line.enumerated().map { x, ch in
                    let p = Point(x, y)
                    return (p, Int(String(ch)) ?? -1)
                }
            }
        grid = Dictionary(points, uniquingKeysWith: { _, new in new })
    }

    func part1() async -> Int {
        let starts = grid.filter { $0.value == 0 }.map { $0.key }
        let ends = grid.filter { $0.value == 9 }.map { $0.key }

        let trail = Trail(grid: grid)

        return starts
            .flatMap { start in
                ends.map { end in
                    trail.findPath(from: start, to: end) ? 1 : 0
                }
            }
            .reduce(0, +)
    }

    func part2() async -> Int {
        let starts = grid.filter { $0.value == 0 }.map { $0.key }
        let trail = Trail(grid: grid)

        return starts
            .map { trail.findRatings(from: $0) }
            .reduce(0, +)
    }

    // for some weird reason, wrapping these methods into their own struct
    // generates code that runs nearly twice as fast compared to when
    // the methods are hoisted up to be in `class Day10` directly
    // ¯\_(ツ)_/¯
    struct Trail {
        let grid: [Point: Int]

        private func neighbors(for point: Point) -> [Point] {
            let height = grid[point]! + 1
            return point
                .neighbors()
                .filter { grid[$0] == height }
        }

        func findPath(from start: Point, to end: Point) -> Bool {
            var queue = Deque<Point>([start])

            while let point = queue.popFirst() {
                if point == end {
                    return true
                }
                queue.append(contentsOf: neighbors(for: point))
            }
            return false
        }

        func findRatings(from start: Point, rating: Int = 0) -> Int {
            if grid[start] == 9 {
                return rating + 1
            }

            return neighbors(for: start)
                .reduce(0) { $0 + findRatings(from: $1, rating: rating) }
        }
    }
}
