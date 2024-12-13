//
// Advent of Code 2024 Day 13
//
// https://adventofcode.com/2024/day/13
//

import AoCTools

private struct Machine {
    let buttonA: Point
    let buttonB: Point
    let prize: Point
}

final class Day13: AOCDay {
    let title = "Claw Contraption"

    private let machines: [Machine]

    init(input: String) {
        let groups = input.lines.grouped(by: \.isEmpty)

        machines = groups.map {
            let btnA = $0[0].allInts()
            let btnB = $0[1].allInts()
            let prize = $0[2].allInts()
            return Machine(
                buttonA: Point(btnA[0], btnA[1]),
                buttonB: Point(btnB[0], btnB[1]),
                prize: Point(prize[0], prize[1])
            )
        }
    }

    func part1() -> Int {
        machines
            .compactMap { pushButtons($0) }
            .reduce(0) { $0 + $1.0 * 3 + $1.1 }
    }

    func part2() -> Int {
        machines
            .compactMap { pushButtons($0, offset: 10_000_000_000_000) }
            .reduce(0) { $0 + $1.0 * 3 + $1.1 }
    }

    private func pushButtons(_ m: Machine, offset: Int = 0) -> (Int, Int)? {
        let prize = m.prize + Point(offset, offset)
        let a =
            (m.buttonB.x * -prize.y + m.buttonB.y * prize.x) /
            (m.buttonB.y * m.buttonA.x - m.buttonB.x * m.buttonA.y)

        let b =
            -(m.buttonA.x * prize.y - m.buttonA.y * prize.x) /
            (m.buttonB.x * m.buttonA.y - m.buttonB.y * m.buttonA.x)

        let x = m.buttonA.x * a + m.buttonB.x * b
        let y = m.buttonA.y * a + m.buttonB.y * b
        if prize == Point(x, y) {
            return (a, b)
        } else {
            return nil
        }
    }
}
