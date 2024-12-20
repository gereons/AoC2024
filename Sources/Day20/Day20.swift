//
// Advent of Code 2024 Day 20
//
// https://adventofcode.com/2024/day/20
//

import AoCTools
import Collections

final class Day20: AOCDay {
    let title = "Race Condition"

    let grid: [Point: Character]

    init(input: String) {
        let points = input.lines
            .enumerated().flatMap { y, line in
                line.enumerated().map { x, ch in
                    let p = Point(x, y)
                    return (p, ch)
                }
            }
        grid = Dictionary(points, uniquingKeysWith: { _, new in new })
    }

    func part1() -> Int {
        part1(minTimeSaved: 100)
    }

    func part1(minTimeSaved: Int) -> Int {
        let start = grid.first { $0.value == "S" }!.key
        let end = grid.first { $0.value == "E" }!.key
        var grid = grid
        grid[start] = "."
        grid[end] = "."

        let raceTrack = RaceTrack(grid: grid)
        let regularPath = raceTrack.shortestPath(from: start, to: end)
        let fullPath = [start] + regularPath
        let distances = Dictionary(uniqueKeysWithValues: fullPath.enumerated().map { ($0.element, $0.offset) })

        var timesSaved = [Int: Int]()
        for (point, distance) in distances {
            for candidate in point.points(within: 2) {
                guard let onPath = distances[candidate] else { continue }
                if onPath > distance + 2 {
                    timesSaved[onPath - distance - 2, default: 0] += 1
                }
            }
        }
        return timesSaved.filter { $0.key >= minTimeSaved }.reduce(0) { $0 + $1.value }
    }

    func part2() -> Int {
        0
    }
}

extension Point {
    func points(within distance: Int) -> [Point] {
        var result = [Point]()
        for x in self.x - distance ... self.x + distance {
            for y in self.y - distance ... self.y + distance {
                let p = Point(x, y)
                if p.distance(to: self) <= distance && p != self {
                    result.append(p)
                }
            }
        }
        return result
    }
}

struct RaceTrack: Pathfinding {
    let grid: [Point: Character]

    func shortestPath(from start: Point, to end: Point) -> [Point] {
        let pathfinder = AStarPathfinder(map: self)
        return pathfinder.shortestPath(from: start, to: end)
    }

    func neighbors(of point: Point) -> [Point] {
        point.neighbors().filter { grid[$0] != "#" }
    }
}
