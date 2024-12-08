//
// Advent of Code 2024 Day 8
//
// https://adventofcode.com/2024/day/8
//

import AoCTools

final class Day08: AOCDay {
    let title = "Resonant Collinearity"

    let grid: [Point: Character]
    let maxX: Int
    let maxY: Int

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
        maxY = lines.count
        maxX = lines[0].count
    }

    func part1() -> Int {
        let antennas = grid.filter { $0.value != "." }
        let frequencies = Set(antennas.map { $0.value })

        var antinodes = Set<Point>()
        for freq in frequencies {
            let check = antennas.filter { $0.value == freq }
            for pair in check.combinations(ofCount: 2) {
                let antenna1 = pair[0].key
                let antenna2 = pair[1].key
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
        0
    }
}
