//
// Advent of Code 2024 Day 12
//
// https://adventofcode.com/2024/day/12
//

import AoCTools
import Collections

final class Day12: AOCDay {
    let title = "Garden Groups"

    let grid: [Point: Character]

    init(input: String) {
        let points = input.lines
            .enumerated().flatMap { y, line in
                line.enumerated().map { x, ch in
                    let p = Point(x, y)
                    return (p, ch)
                }
            }
        grid = Dictionary(points, uniquingKeysWith: { _, new in new } )
    }

    func part1() -> Int {
        var grid = self.grid

        var regions = [[Point: Character]]()

        // var queue = Deque([(Point(53, 13), Character("G"))])

        while let (point, ch) = grid.first {
            // print("start search", point, ch)
            var region = [Point: Character]()

            var queue = Set([point])
            while let p = queue.popFirst() {
                region[p] = ch

                let n = p.neighbors().filter {
                    grid[$0] == ch && !region.keys.contains($0)
                }
                queue.formUnion(n)
            }
            // print("found region", region)
            regions.append(region)

            region.keys.forEach {
                grid[$0] = nil
            }
        }

        return regions.map {
            $0.count * perimeter(of: $0)
        }
        .reduce(0, +)
    }

    private func perimeter(of region: [Point: Character]) -> Int {
        var perimeter = 0
        let regionKeys = Set(region.keys)
        for p in regionKeys {
            let p = 4 - p.neighbors().filter { regionKeys.contains($0) }.count
            perimeter += p
        }
        // print("region", region, perimeter)
        return perimeter
    }

    func part2() -> Int {
        0
    }
}
