//
// Advent of Code 2024 Day 16
//
// https://adventofcode.com/2024/day/16
//

import AoCTools
import Collections

final class Day16: AOCDay {
    let title = "Reindeer Maze"
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
        let start = grid.first { $0.value == "S" }!.key
        let end = grid.first { $0.value == "E" }!.key

        let paths = findShortestPaths(in: grid, from: start, to: end, allPaths: false)
        return paths.first?.score ?? 0
    }

    func part2() -> Int {
        let start = grid.first { $0.value == "S" }!.key
        let end = grid.first { $0.value == "E" }!.key

        let paths = findShortestPaths(in: grid, from: start, to: end, allPaths: true)

        var bestSeats: Set<Point> = []
        let minScore = paths.first?.score ?? 0
        for path in paths.filter({ $0.score == minScore }) {
            bestSeats.formUnion(path.path)
        }

        return bestSeats.count
    }

    struct PathStep: Hashable {
        let point: Point
        let direction: Direction

        var forward: PathStep {
            PathStep(point: point.moved(to: direction), direction: direction)
        }

        var clockwise: PathStep {
            let dir = direction.turned(.clockwise)
            return PathStep(point: point.moved(to: dir), direction: dir)
        }

        var counterclockwise: PathStep {
            let dir = direction.turned(.counterclockwise)
            return PathStep(point: point.moved(to: dir), direction: dir)
        }
    }

    struct Node: Comparable {
        let step: PathStep
        let score: Int
        let history: Set<Point>

        var neighbors: [PathStep] {
            [step.forward, step.clockwise, step.counterclockwise]
        }

        static func < (lhs: Node, rhs: Node) -> Bool {
            lhs.score < rhs.score
        }
    }

    private func findShortestPaths(in grid: [Point: Character], from start: Point, to end: Point, allPaths: Bool) -> [(path: Set<Point>, score: Int)] {
        struct ScoreKey: Hashable {
            let position: Point
            let direction: Direction
        }

        var scores = [
            PathStep(point: start, direction: .e): 0
        ]

        var shortestPaths: [(path: Set<Point>, score: Int)] = []

        var heap = Heap<Node>()
        heap.insert(Node(step: PathStep(point: start, direction: .e), score: 0, history: [start]))

        while let node = heap.popMin() {
            if node.step.point == end {
                shortestPaths.append((path: node.history, score: node.score))
                continue
            }

            var candidates = [Node]()

            for neighbor in node.neighbors {
                if !node.history.contains(neighbor.point), grid[neighbor.point]! != "#" {
                    let add = node.step.direction == neighbor.direction ? 1 : 1001
                    candidates.append(Node(step: neighbor, score: node.score + add, history: node.history.union([neighbor.point])))
                }
            }

            for candidate in candidates {
                let oldScore = scores[candidate.step]

                if oldScore == nil || candidate.score < (oldScore! + (allPaths ? 1 : 0)) {
                    scores[candidate.step] = candidate.score

                    heap.insert(candidate)
                }
            }
        }

        return shortestPaths
    }
}
