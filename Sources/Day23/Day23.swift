//
// Advent of Code 2024 Day 23
//
// https://adventofcode.com/2024/day/23
//

import AoCTools

final class Day23: AOCDay {
    let title = "LAN Party"

    let connections: Set<Pair<String, String>>

    init(input: String) {
        var conn = Set<Pair<String, String>>()
        for line in input.lines {
            let parts = line.split(separator: "-").map { String($0) }
            conn.insert(Pair(parts[0], parts[1]))
            conn.insert(Pair(parts[1], parts[0]))
        }
        connections = conn
    }

    func part1() -> Int {
        var trios = Set<Set<String>>()
        for pair in connections {
            let firstConn = connections.filter { $0.first == pair.first && $0.second != pair.second }.map { $0.second }
            let secondConn = connections.filter { $0.first == pair.second && $0.second != pair.first }.map { $0.second }
            let thirds = Set(firstConn).intersection(secondConn)
            for third in thirds {
                let trio = Set([pair.first, pair.second, third])
                trios.insert(trio)
            }
        }

        let ts = trios.filter { set in
            set.contains { $0.hasPrefix("t") }
        }

        return ts.count
    }

    func part2() -> Int {
        0
    }
}
