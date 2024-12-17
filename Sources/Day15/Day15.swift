//
// Advent of Code 2024 Day 15
//
// https://adventofcode.com/2024/day/15
//

import AoCTools

final class Day15: AOCDay {
    let title = "Warehouse Woes"

    let grid: [Point: Character]
    let grid2: [Point: Character]
    let directions: [Direction]

    init(input: String) {
        let groups = input.lines.grouped(by: \.isEmpty)

        let points = groups[0]
            .enumerated().flatMap { y, line in
                line.enumerated().map { x, ch in
                    let p = Point(x, y)
                    return (p, ch)
                }
            }
        grid = Dictionary(points, uniquingKeysWith: { _, new in new })
        directions = groups[1].joined().map {
            switch $0 {
            case "^": .up
            case "v": .down
            case "<": .left
            case ">": .right
            default: fatalError()
            }
        }

        func expand(_ str: String) -> String {
            str.replacingOccurrences(of: ".", with: "..")
                .replacingOccurrences(of: "#", with: "##")
                .replacingOccurrences(of: "O", with: "[]")
                .replacingOccurrences(of: "@", with: "@.")
        }

        let points2 = groups[0]
            .enumerated().flatMap { y, line in
                expand(line).enumerated().map { x, ch in
                    let p = Point(x, y)
                    return (p, ch)
                }
            }
        grid2 = Dictionary(points2, uniquingKeysWith: { _, new in new })
    }

    func part1() -> Int {
        var grid = self.grid

        var robotPosition = grid.first { $0.value == "@" }!.key
        for dir in directions {
            robotPosition = move(from: robotPosition, in: &grid, direction: dir)
        }

        return grid
            .filter { $0.value == "O" }
            .keys
            .map { $0.x + $0.y * 100 }
            .reduce(0, +)
    }

    @discardableResult
    private func move(from start: Point, in grid: inout [Point: Character], direction: Direction) -> Point {
        let ch = grid[start]
        let moved = start.moved(to: direction)

        if grid[moved] == "#" {
            return start
        }

        func performMove() -> Point {
            grid[moved] = ch
            grid[start] = "."
            return moved
        }

        if grid[moved] == "." {
            return performMove()
        }

        // hit a box, shove it if possible
        move(from: moved, in: &grid, direction: direction)
        if grid[moved] == "O" {
            return start
        }
        if grid[moved] == "." {
            return performMove()
        }
        fatalError()
    }

    func part2() -> Int {
        let warehouse = Warehouse(grid: self.grid2)

        var robotPosition = grid2.first { $0.value == "@" }!.key
        for dir in directions {
            if warehouse.move(robotPosition, dir, update: true) {
                robotPosition += dir.offset
            }
        }

        return warehouse.grid
            .filter { $0.value == "[" }
            .keys
            .map { $0.x + $0.y * 100 }
            .reduce(0, +)
    }

    final class Warehouse {
        private(set) var grid: [Point: Character]

        init(grid: [Point: Character]) {
            self.grid = grid
        }

        func move(_ position: Point, _ direction: Direction, update: Bool = false) -> Bool {
            let moved = position + direction

            if grid[position] == "." {
                return true
            }
            if grid[position] == "#" {
                return false
            }
            if direction == .left || direction == .right {
                return move(moved, direction) && swap(position, moved)
            }
            if grid[position] == "@" {
                return move(moved, direction, update: update) && swap(position, moved)
            }
            if grid[position] == "]" {
                return move(position + .left, direction, update: update)
            }

            switch (grid[moved], grid[moved + .right]) {
            case (".", "."):
                return !update || swap(position, moved) && swap(position + .right, moved + .right)
            case ("[", "]"):
                return
                    move(moved, direction) && !update ||
                    (move(moved, direction, update: true) && move(position, direction, update: true))
            case ("]", "."):
                return
                    move(moved + .left, direction) && !update ||
                    (move(moved + .left, direction, update: true) && move(position, direction, update: true))
            case (".", "["):
                return
                    move(moved + .right, direction) && !update ||
                    (move(moved + .right, direction, update: true) && move(position, direction, update: true))
            case ("]", "["):
                return
                    move(moved + .left, direction) &&
                    move(moved + .right, direction) &&
                    (!update || (
                        move(moved + .left, direction, update: true) &&
                        move(moved + .right, direction, update: true) &&
                        move(position, direction, update: true)
                    ))
            default:
                return false
            }
        }

        func swap(_ a: Point, _ b: Point) -> Bool {
            let tmp = grid[a]!
            grid[a] = grid[b]!
            grid[b] = tmp
            return true
        }
    }
}

fileprivate extension Point {
    static func + (lhs: Point, rhs: Direction) -> Point {
        lhs + rhs.offset
    }
}
