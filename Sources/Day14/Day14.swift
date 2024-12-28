//
// Advent of Code 2024 Day 14
//
// https://adventofcode.com/2024/day/14
//

import AoCTools

private struct Robot {
    let position: Point
    let velocity: Point
}

final class Day14: AOCDay {
    let title = "Restroom Redoubt"

    private let robots: [Robot]
    let width: Int
    let height: Int

    convenience init(input: String) {
        self.init(input: input, width: 101, height: 103)
    }

    init(input: String, width: Int, height: Int) {
        robots = input.lines
            .map { $0.integers() }
            .map { Robot(position: Point($0[0], $0[1]), velocity: Point($0[2], $0[3])) }
        self.height = height
        self.width = width
    }

    func part1() -> Int {
        let positions = robots
            .map { move($0, seconds: 100) }
            .map { $0.position }

        let q1 = positions.filter { $0.x < width / 2 && $0.y < height / 2 }.count
        let q2 = positions.filter { $0.x > width / 2 && $0.y < height / 2 }.count
        let q3 = positions.filter { $0.x < width / 2 && $0.y > height / 2 }.count
        let q4 = positions.filter { $0.x > width / 2 && $0.y > height / 2 }.count

        return q1 * q2 * q3 * q4
    }

    private func move(_ robot: Robot, seconds: Int) -> Robot {
        let newX = robot.position.x + seconds * robot.velocity.x
        let newY = robot.position.y + seconds * robot.velocity.y

        return Robot(
            position: Point(
                clamp(newX, max: width),
                clamp(newY, max: height)
            ),
            velocity: robot.velocity
        )
    }

    private func clamp(_ value: Int, max: Int) -> Int {
        if value > 0 {
            return value % max
        } else {
            let mod = (-value % max)
            return mod == 0 ? 0 : max - mod
        }
    }

    func part2() -> Int {
        // find the second where the total distance of all robots to the grid's center
        // is the lowest
        let mid = Point(width / 2, height / 2)
        var minDistance = Int.max
        var minSec = 0
        for sec in 1 ... (width * height) {
            let robots = robots.map { move($0, seconds: sec) }
            let distance = robots.map { $0.position.distance(to: mid) }.reduce(0, +)
            if distance < minDistance {
                minDistance = distance
                minSec = sec
            }
        }

        return minSec

        // initially solved visually by looking at the output of
        //
        // robots.forEach { $0.reset() }
        //
        // for i in 1 ... width * height {
        //     for var robot in robots {
        //         move(&robot)
        //     }
        //
        //     print(i)
        //     let map = Dictionary(robots.map { ($0.position, true) }, uniquingKeysWith: { _, new in new })
        //     let grid = Grid(points: map)
        //     grid.draw()
        // }
    }
}
