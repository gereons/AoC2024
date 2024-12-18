//
// Advent of Code 2024 Day 18
//
// https://adventofcode.com/2024/day/18
//

import AoCTools

final class Day18: AOCDay {
    let title = "RAM Run"

    let bytes: [Point]
    var ram = [Point: Character]()

    init(input: String) {
        bytes = input.lines.map { $0.allInts() }.map { Point($0[0], $0[1]) }
    }

    func part1() -> Int {
        part1(fallen: 1024, gridSize: 70)
    }

    func part1(fallen: Int, gridSize: Int) -> Int {
        let ram = emptyRAM(size: gridSize)
        return findPath(through: ram, fallenBytes: bytes.prefix(fallen), gridSize: gridSize)
    }

    func part2() -> String {
        part2(fallen: 1024, gridSize: 70)
    }

    func part2(fallen: Int, gridSize: Int) -> String {
        let ram = emptyRAM(size: gridSize)
        for prefix in fallen + 1 ..< bytes.count {
            let bytes = bytes.prefix(prefix)
            if findPath(through: ram, fallenBytes: bytes, gridSize: gridSize) == 0 {
                return bytes.last!.description
            }
        }
        return ""
    }

    private func findPath(through ram: [Point: Character], fallenBytes: any Sequence<Point>, gridSize: Int) -> Int {
        var ram = ram
        fallenBytes.forEach { ram[$0] = "#" }

        let ramNavigator = RAMNavigator(ram: ram)
        let pathfinder = AStarPathfinder(map: ramNavigator)
        let path = pathfinder.shortestPath(from: .zero, to: Point(gridSize, gridSize))
        return path.count
    }

    private func emptyRAM(size: Int) -> [Point: Character] {
        let points = (0...size).flatMap { x in
            (0...size).map { y in
                Point(x, y)
            }
        }
        return Dictionary(uniqueKeysWithValues: points.map { ($0, ".") })
    }
}

private struct RAMNavigator: Pathfinding {
    let ram: [Point: Character]

    func neighbors(of point: Point) -> [Point] {
        point.neighbors().filter { ram[$0] == "." }
    }
}
