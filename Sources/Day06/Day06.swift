//
// Advent of Code 2024 Day 6
//
// https://adventofcode.com/2024/day/6
//

import AoCTools

final class Day06: AOCDay {
    let title = "Guard Gallivant"

    let grid: [Point: Character]
    let start: Point
    let area: Int

    init(input: String) {
        let lines = input.lines
        let points = lines
            .enumerated().flatMap { y, line in
                line.enumerated().map { x, ch in
                    let p = Point(x, y)
                    return (p, ch)
                }
            }
        grid = Dictionary(points, uniquingKeysWith: { _, new in new } )
        start = grid.first { $0.value == "^" }!.key
        area = grid.count { $0.value == "." } + 1
    }

    func part1() -> Int {
        let path = findPath(from: start)
        return path.count
    }

    private func findPath(from start: Point) -> Set<Point> {
        var visited = Set([start])
        var direction = Direction.n
        var current = start
        while true {
            let next = current.moved(to: direction)
            switch grid[next] {
            case nil:
                return visited
            case "#":
                direction = direction.turned(.clockwise)
            case ".", "^":
                visited.insert(next)
                current = next
            default: fatalError()
            }
        }
    }

    func part2() -> Int {
        var path = findPath(from: start)
        path.remove(start)

        // try placing an obstacle on every coordinate of the path
        var loops = 0
        for point in path {
            var grid = self.grid
            grid[point] = "#"

            var current = start
            var direction = Direction.n
            var steps = 0
            outerLoop: while true {
                // we've taken more steps than there are available
                // positions, so this must be a loop
                if steps > area {
                    loops += 1
                    break
                }
                let next = current.moved(to: direction)
                switch grid[next] {
                case nil:
                    break outerLoop
                case "#":
                    direction = direction.turned(.clockwise)
                case ".", "^":
                    steps += 1
                    current = next
                default:
                    fatalError()
                }
            }
        }

        return loops
    }
}
