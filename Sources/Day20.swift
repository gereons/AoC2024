//
// Advent of Code 2024 Day 20
//
// https://adventofcode.com/2024/day/20
//

import AoCTools
import Collections

final class Day20: AdventOfCodeDay {
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

    func part1() async -> Int {
        await part1(minTimeSaved: 100)
    }

    func part1(minTimeSaved: Int) async -> Int {
        possibleCheats(minTimeSaved: minTimeSaved, cheatDistance: 2)
    }

    func part2() async -> Int {
        await part2(minTimeSaved: 100)
    }

    func part2(minTimeSaved: Int) async -> Int {
        possibleCheats(minTimeSaved: minTimeSaved, cheatDistance: 20)
    }

    private func possibleCheats(minTimeSaved: Int, cheatDistance: Int) -> Int {
        let start = grid.first { $0.value == "S" }!.key
        let end = grid.first { $0.value == "E" }!.key
        var grid = grid
        grid[start] = "."
        grid[end] = "."

        let raceTrack = RaceTrack(grid: grid)
        let regularPath = raceTrack.shortestPath(from: start, to: end)
        let fullPath = [start] + regularPath
        let fullPathDistances = Array(fullPath.enumerated())

        var timesSaved = [Int: Int]()
        for (distance, point) in fullPathDistances {
            // check cheating to any point further along the path that is still within `cheatDistance`
            let candidates = fullPathDistances[distance...].filter { $0.element.distance(to: point) <= cheatDistance }
            for candidate in candidates {
                let d = point.distance(to: candidate.element)
                if candidate.offset > distance + d {
                    timesSaved[candidate.offset - distance - d, default: 0] += 1
                }
            }
        }
        return timesSaved
            .filter { $0.key >= minTimeSaved }
            .reduce(0) { $0 + $1.value }
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
