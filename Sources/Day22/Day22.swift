//
// Advent of Code 2024 Day 22
//
// https://adventofcode.com/2024/day/22
//

import AoCTools
import Algorithms

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
        // for each monkey: map of price changes and their resulting price
        // store price only the first time we see each list of changes
        var monkeyRuns = [Int: [[Int]: Int]]()
        for (monkeyId, secret) in secrets.enumerated() {
            let changes = priceChanges(initial: secret, n: 2000)

            for run in changes.windows(ofCount: 4) {
                let changes = run.map { $0.change }
                let price = run.last!.price
                if monkeyRuns[monkeyId]?[changes] == nil {
                    monkeyRuns[monkeyId, default: [:]][changes] = price
                }
            }
        }

        // sum up the total price for each run of changes
        var sums = [[Int]: Int]()
        for runs in monkeyRuns.values {
            for (changes, price) in runs {
                sums[changes, default: 0] += price
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
