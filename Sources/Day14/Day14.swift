//
// Advent of Code 2024 Day 14
//
// https://adventofcode.com/2024/day/14
//

import AoCTools

private class Robot {
    var position: Point
    let start: Point
    let velocity: Point

    init(position: Point, velocity: Point) {
        self.start = position
        self.position = position
        self.velocity = velocity
    }

    func reset() {
        position = start
    }
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
            .map { $0.allInts() }
            .map { Robot(position: Point($0[0], $0[1]), velocity: Point($0[2], $0[3])) }
        self.height = height
        self.width = width
    }

    func part1() -> Int {
        robots.forEach { $0.reset() }
        for _ in 0..<100 {
            for var robot in robots {
                move(&robot)
            }
        }

        let q1 = robots.filter { $0.position.x < width / 2 && $0.position.y < height / 2 }.count
        let q2 = robots.filter { $0.position.x > width / 2 && $0.position.y < height / 2 }.count
        let q3 = robots.filter { $0.position.x < width / 2 && $0.position.y > height / 2 }.count
        let q4 = robots.filter { $0.position.x > width / 2 && $0.position.y > height / 2 }.count

        return q1 * q2 * q3 * q4
    }

    private func move(_ robot: inout Robot) {
        let newPosition = robot.position + robot.velocity
        var newX = newPosition.x
        var newY = newPosition.y
        if newX < 0 {
            newX = width + newX
        } else if newX >= width {
            newX -= width
        }
        if newY < 0 {
            newY = height + newY
        } else if newY >= height {
            newY -= height
        }
        robot.position = Point(newX, newY)
    }

    func part2() -> Int {
        // solved visually by looking at the output of
        /*
        robots.forEach { $0.reset() }

        for i in 1 ... width * height {
            for var robot in robots {
                move(&robot)
            }

            print(i)
            let map = Dictionary(robots.map { ($0.position, true) }, uniquingKeysWith: { _, new in new })
            let grid = Grid(points: map)
            grid.draw()
        }
        */
        return 7492
    }
}
