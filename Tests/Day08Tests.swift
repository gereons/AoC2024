//
// Advent of Code 2024 Day 8 Tests
//

import XCTest
@testable import AdventOfCode

@MainActor
final class Day08Tests: XCTestCase {
    let testInput = """
"""

    func testDay08_part1() throws {
        let day = Day08(input: testInput)
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay08_part1_solution() throws {
        let day = Day08(input: Day08.input)
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay08_part2() throws {
        let day = Day08(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay08_part2_solution() throws {
        let day = Day08(input: Day08.input)
        XCTAssertEqual(day.part2(), 0)
    }
}
