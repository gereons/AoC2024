//
// Advent of Code 2024 Day 12
//
// https://adventofcode.com/2024/day/12
//

import AoCTools
import Collections

final class Day12: AdventOfCodeDay {
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
        grid = Dictionary(points, uniquingKeysWith: { _, new in new })
    }

    func part1() async -> Int {
        regions().map {
            $0.count * perimeter(of: $0)
        }
        .reduce(0, +)
    }

    func part2() async -> Int {
        return regions().map {
            $0.count * edges(of: $0)
        }
        .reduce(0, +)
    }

    private func regions() -> [Set<Point>] {
        var grid = self.grid
        var regions = [Set<Point>]()

        while let (point, ch) = grid.first {
            var region = Set<Point>()

            var queue = Set([point])
            while let p = queue.popFirst() {
                region.insert(p)
                let n = p.neighbors().filter {
                    grid[$0] == ch && !region.contains($0)
                }
                queue.formUnion(n)
            }
            regions.append(region)

            region.forEach {
                grid[$0] = nil
            }
        }
        return regions
    }

    private func perimeter(of region: Set<Point>) -> Int {
        var perimeter = 0
        for p in region {
            let p = 4 - p.neighbors().filter { region.contains($0) }.count
            perimeter += p
        }
        return perimeter
    }

    private func edges(of region: Set<Point>) -> Int {
        let (minX, maxX) = region.minAndMax(of: \.x)!
        let (minY, maxY) = region.minAndMax(of: \.y)!

        var edges = 0
        // top to bottom
        for y in minY...maxY {
            let points = region.filter { !region.contains(Point($0.x, y - 1)) && $0.y == y }.sorted(by: \.x)
            let chunks = points.chunked { p1, p2 in p2.x - p1.x == 1 }
            edges += chunks.count
        }

        // bottom to top
        for y in (minY...maxY).reversed() {
            let points = region.filter { !region.contains(Point($0.x, y + 1)) && $0.y == y }.sorted(by: \.x)
            let chunks = points.chunked { p1, p2 in p2.x - p1.x == 1 }
            edges += chunks.count
        }

        // left to right
        for x in minX...maxX {
            let points = region.filter { !region.contains(Point(x - 1, $0.y)) && $0.x == x }.sorted(by: \.y)
            let chunks = points.chunked { p1, p2 in p2.y - p1.y == 1 }
            edges += chunks.count
        }

        // right to left
        for x in (minX...maxX).reversed() {
            let points = region.filter { !region.contains(Point(x + 1, $0.y)) && $0.x == x }.sorted(by: \.y)
            let chunks = points.chunked { p1, p2 in p2.y - p1.y == 1 }
            edges += chunks.count
        }

        return edges
    }
}
