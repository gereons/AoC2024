//
// Advent of Code 2024 Day 22
//
// https://adventofcode.com/2024/day/22
//

import AoCTools

private struct Run: Hashable {
    let changes: [Int]
    let price: Int
}

private typealias PriceChange = (price: Int, change: Int)

final class Day22: AOCDay {
    let title = "Monkey Market"

    let secrets: [Int]

    init(input: String) {
        secrets = input.lines.map { Int($0)! }
    }

    func part1() -> Int {
        secrets
            .map {
                getNthSecret(initial: $0, n: 2000)
            }
            .reduce(0, +)
    }

    func part2() -> Int {
        // for each monkey: list of price changes and their resulting price
        var monkeyRuns = [Int: [Run]]()

        for (monkeyId, secret) in secrets.enumerated() {
            let changes = priceChanges(initial: secret, n: 2000)

            for run in changes.runs(ofLength: 4) {
                let r = Run(changes: [run[0].change, run[1].change, run[2].change, run[3].change], price: run[3].price)
                monkeyRuns[monkeyId, default: []].append(r)
            }
        }

        // sum up the total price for each run of changes, but only one per monkey
        var sums = [[Int]: Int]()
        var monkeyChangeSeen = Set<[Int]>()
        for (monkeyId, runs) in monkeyRuns {
            for run in runs {
                let key = [monkeyId] + run.changes
                if monkeyChangeSeen.contains(key) {
                    continue
                }
                sums[run.changes, default: 0] += run.price
                monkeyChangeSeen.insert(key)
            }
        }

        return sums.max(of: \.value)!
    }

    private func priceChanges(initial secret: Int, n: Int) -> [PriceChange] {
        var secret = secret
        var prevDigit = secret % 10
        var results = [PriceChange]()
        for _ in 0 ..< n {
            secret = mixPrune(secret, secret * 64)
            secret = mixPrune(secret, secret / 32)
            secret = mixPrune(secret, secret * 2048)
            let digit = secret % 10
            results.append((price: digit, change: digit - prevDigit))
            prevDigit = digit
        }

        return results
    }

    private func getNthSecret(initial secret: Int, n: Int) -> Int {
        var secret = secret
        for _ in 0 ..< n {
            secret = mixPrune(secret, secret * 64)
            secret = mixPrune(secret, secret / 32)
            secret = mixPrune(secret, secret * 2048)
        }
        return secret
    }

    private func mixPrune(_ secret: Int, _ value: Int) -> Int {
        (secret ^ value) % 16777216
    }
}

private extension Array {
    func runs(ofLength n: Int) -> [[Element]] {
        (0 ... (count - n)).map {
            Array(self[$0 ..< $0 + n])
        }
    }
}
