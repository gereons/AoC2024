//
// Advent of Code 2024 Day 8
//
// https://adventofcode.com/2024/day/8
//

import AoCTools

final class Day08: AOCDay {
    let title = "Resonant Collinearity"

    let grid: [Point: Character]

    init(input: String) {
        let lines = input.lines
        let points = lines
            .enumerated().flatMap { y, line in
                line.enumerated().map { x, ch in
                    let p = Point(x, y)
                    return (p, ch)
                }
            }
        grid = Dictionary(points, uniquingKeysWith: { _, new in new })
    }

    func part1() -> Int {
        var antennas = [Character: [Point]]()
        for (point, ch) in grid {
            if ch == "." { continue }
            antennas[ch, default: []].append(point)
        }

        var antinodes = Set<Point>()
        for check in antennas.values {
            for pair in check.combinations(ofCount: 2) {
                let antenna1 = pair[0]
                let antenna2 = pair[1]
                let vector = antenna1 - antenna2

                if grid[antenna1 + vector] != nil {
                    antinodes.insert(antenna1 + vector)
                }

                if grid[antenna2 - vector] != nil {
                    antinodes.insert(antenna2 - vector)
                }
            }
        }

        return antinodes.count
    }

    func part2() -> Int {
        var antennas = [Character: [Point]]()
        for (point, ch) in grid {
            if ch == "." { continue }
            antennas[ch, default: []].append(point)
        }

        var antinodes = Set<Point>()
        for check in antennas.values {
            for pair in check.combinations(ofCount: 2) {
                let antenna1 = pair[0]
                let antenna2 = pair[1]
                let vector = antenna1 - antenna2

                var p = antenna1
                while grid[p] != nil {
                    antinodes.insert(p)
                    p += vector
                }

                p = antenna2
                while grid[p] != nil {
                    antinodes.insert(p)
                    p -= vector
                }
            }
        }

        return antinodes.count
    }
}
