//
// Advent of Code 2024 Day 20
//
// https://adventofcode.com/2024/day/20
//

import AoCTools
import Collections

final class Day20: AOCDay {
    let title = "Race Condition"

    let grid: [[Character]]
    let walls: Set<Point>
    let start: Point
    let end: Point

    init(input: String) {
        var points = input.lines.map { Array($0) }
        var walls = Set<Point>()
        var start: Point?
        var end: Point?
        for y in 0..<points.count {
            for x in 0..<points[y].count {
                let p = Point(x, y)
                if points[p] == "S" {
                    start = p
                } else if points[p] == "E" {
                    end = p
                } else if points[p] == "#" {
                    walls.insert(p)
                }
            }
        }
        points[start!] = "."
        points[end!] = "."
        self.grid = points
        self.walls = walls
        self.start = start!
        self.end = end!
    }

    func part1() -> Int {
        part1(minTimeSaved: 100)
    }

    func part1(minTimeSaved: Int) -> Int {
        let raceTrack = RaceTrack(grid: grid)
        let regularTime = raceTrack.shortestTime(from: start, to: end)

        var cheatCandidates = [Point]()
        for wall in walls {
            if grid[safe: wall + .left] == "." && grid[safe: wall + .right] == "." {
                cheatCandidates.append(wall)
            }
            if grid[safe: wall + .up] == "." && grid[safe: wall + .down] == "." {
                cheatCandidates.append(wall)
            }
        }

        var timesSaved = [Int: Int]()
        for cheat in cheatCandidates {
            var grid = grid
            grid[cheat] = "."
            let cheatTrack = RaceTrack(grid: grid)
            let cheatTime = cheatTrack.shortestTime(from: start, to: end)
            timesSaved[regularTime - cheatTime, default: 0] += 1
        }

        return timesSaved.filter { $0.key >= minTimeSaved }.reduce(0) { $0 + $1.value }
    }

    func part2() -> Int {
        0
    }
}

struct RaceTrack {
    let grid: [[Character]]

    func shortestTime(from start: Point, to end: Point) -> Int {
        var queue = Deque([(start, 0)])
        var visited = Set([start])

        while let (next, len) = queue.popFirst() {
            if next == end {
                return len
            }
            visited.insert(next)
            for n in neighbors(of: next) {
                if !visited.contains(n) {
                    queue.append((n, len + 1))
                }
            }
        }
        fatalError()
    }

    func neighbors(of point: Point) -> [Point] {
        var n = [Point]()
        for dir in Direction.orthogonal {
            let p = point + dir
            if grid[p] == "." { n.append(p) }
        }
        return n
    }
}
