//
// Advent of Code 2024 Day 9
//
// https://adventofcode.com/2024/day/9
//

import AoCTools

final class Day09: AOCDay {
    let title = "Disk Fragmenter"
    
    let map: [Int]
    init(input: String) {
        map = input.map { Int(String($0))! }
    }

    func part1() -> Int {
        var blocks = [Int]()
        var fileId = 0
        for (index, digit) in map.enumerated() {
            if index.isMultiple(of: 2) {
                // a file
                blocks.append(contentsOf: [Int](repeating: fileId, count: digit))
                fileId += 1
            } else {
                // free space
                blocks.append(contentsOf: [Int](repeating: -1, count: digit))
            }
        }

        var firstFree = -1
        while let firstFreeIndex = firstFreeIndex(after: firstFree, in: blocks) {
            var last: Int
            repeat {
                last = blocks.removeLast()
            } while last == -1

            blocks[firstFreeIndex] = last
            firstFree = firstFreeIndex
        }

        var checksum = 0
        for (index, id) in blocks.enumerated() {
            checksum += index * id
        }
        return checksum
    }

    enum Block {
        case file(id: Int, size: Int)
        case free(size: Int)

        func isFree(minSize: Int) -> Bool {
            switch self {
            case .file: false
            case .free(let size): size >= minSize
            }
        }

        func isFile(id: Int) -> Bool {
            switch self {
            case .file(let fileId, _): fileId == id
            case .free: false
            }
        }

        var size: Int {
            switch self {
            case .file(_, let size): size
            case .free(let size): size
            }
        }
    }

    func part2() -> Int {
        var blocks = [Block]()
        var fileSizes = [Int: Int]()
        var fileId = 0
        for (index, digit) in map.enumerated() {
            if index.isMultiple(of: 2) {
                // a file
                blocks.append(.file(id: fileId, size: digit))
                fileSizes[fileId] = digit
                fileId += 1
            } else {
                // free space
                blocks.append(.free(size: digit))
            }
        }

        var newBlocks = blocks
        for moveId in (0..<fileId).reversed() {
            let fileSize = fileSizes[moveId]!
            let fileIndex = newBlocks.firstIndex(where: { $0.isFile(id: moveId) })!

            guard let freeIndex = firstFreeIndex(before: fileIndex, minSize: fileSize, in: newBlocks) else {
                continue
            }

            let freeSize = newBlocks[freeIndex].size
            newBlocks[fileIndex] = .free(size: fileSize)
            newBlocks[freeIndex] = .file(id: moveId, size: fileSize)
            if fileSize != freeSize {
                newBlocks.insert(.free(size: freeSize - fileSize), at: freeIndex + 1)
            }
        }

        var checksum = 0
        for (index, id) in expandBlocks(newBlocks).enumerated() {
            if id != -1 {
                checksum += index * id
            }
        }
        return checksum
    }

    private func expandBlocks(_ blocks: [Block]) -> [Int] {
        var result = [Int]()
        for b in blocks {
            switch b {
            case let .file(id, size):
                let arr = [Int](repeating: id, count: size)
                result.append(contentsOf: arr)
            case let .free(size):
                let arr = [Int](repeating: -1, count: size)
                result.append(contentsOf: arr)
            }
        }
        return result
    }

    private func firstFreeIndex(after first: Int, in array: [Int]) -> Int? {
        var index = first + 1
        while index < array.count {
            if array[index] == -1 { return index }
            index += 1
        }
        return nil
    }

    private func firstFreeIndex(before end: Int, minSize: Int, in array: [Block]) -> Int? {
        for index in 0..<end {
            switch array[index] {
            case .file: continue
            case .free(let size): if size >= minSize { return index }
            }
        }
        return nil
    }
}
