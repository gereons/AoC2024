//
// Advent of Code 2024 Day 23
//
// https://adventofcode.com/2024/day/23
//

import AoCTools
import Collections

final class Day23: AdventOfCodeDay {
    let title = "LAN Party"

    typealias Pair = AoCTools.Pair<String, String>

    let connections: Set<Pair>

    init(input: String) {
        var conn = Set<Pair>()
        for line in input.lines {
            let parts = line.split(separator: "-").map { String($0) }
            conn.insert(Pair(parts[0], parts[1]))
            conn.insert(Pair(parts[1], parts[0]))
        }
        connections = conn
    }

    func part1() async -> Int {
        var trios = Set<Set<String>>()
        var seen = Set<Pair>()
        for pair in connections {
            // skip "aa-bb" if we've already seen "bb-aa"
            if seen.contains(Pair(pair.second, pair.first)) {
                continue
            }
            seen.insert(pair)

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

    func part2() async -> String {
        var cliques = Set<Set<String>>()
        for start in Set(connections.map { $0.first }) {
            if cliques.contains(where: { $0.contains(start) }) {
                continue
            }
            let clique = findAllConnectedTo(start)
            cliques.insert(clique)
        }

        return cliques
            .sorted(by: { $0.count > $1.count })
            .first!
            .sorted()
            .joined(separator: ",")
    }

    private func findAllConnectedTo(_ start: String) -> Set<String> {
        var clique = Set([start])
        var candidates = Deque<String>([start])

        while let candidate = candidates.popFirst() {
            // neighbors of our current candidate
            let neighbors = connections.filter { $0.first == candidate }
            // only look at ones that are connected to everyone in our clique so far
            var nextCandidates = neighbors
                .map { $0.second }
                .filter { !clique.contains($0) }
                .filter { isConnected($0, toEveryoneIn: clique) }
                .makeSet()
            clique.formUnion(nextCandidates)
            // remove all entries from clique that aren't connected to everyone else any longer
            for entry in clique {
                if !isConnected(entry, toEveryoneIn: clique) {
                    clique.remove(entry)
                    nextCandidates.remove(entry)
                }
            }
            candidates.append(contentsOf: nextCandidates)
        }

        return clique
    }

    private func isConnected(_ node: String, toEveryoneIn clique: Set<String>) -> Bool {
        clique.allSatisfy { node == $0 || connections.contains(Pair(node, $0)) }
    }
}
