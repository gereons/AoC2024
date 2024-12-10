//
// Advent of Code 2024 Day 10
//
// https://adventofcode.com/2024/day/10
//

import AoCTools

final class Day10: AOCDay {
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
        grid = Dictionary(points, uniquingKeysWith: { _, new in new } )
    }

    func part1() -> Int {
        let starts = grid.filter { $0.value == 0 }.map { $0.key }
        let ends = grid.filter { $0.value == 9 }.map { $0.key }

        let pathfinder = AStarPathfinder(map: Trail(grid: grid))

        return starts.flatMap { start in
            ends.map { end in
                pathfinder.shortestPath(from: start, to: end) != [] ? 1 : 0
            }
        }.reduce(0, +)
    }

    func part2() -> Int {
        let starts = grid.filter { $0.value == 0 }.map { $0.key }
        let trail = Trail(grid: grid)

        return starts
            .reduce(0) { $0 + trail.findRatings(from: $1) }
    }

    struct Trail: Pathfinding {
        let grid: [Point: Int]

        func neighbors(for point: Point) -> [Point] {
            let height = grid[point]!
            return point
                .neighbors()
                .filter { grid[$0] == height + 1 }
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
