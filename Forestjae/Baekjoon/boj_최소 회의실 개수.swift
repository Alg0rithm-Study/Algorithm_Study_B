//
//  boj_최소 회의실 개수.swift
//  
//
//  Created by 이승재 on 2022/02/23.
//

import Foundation

let number = Int(readLine()!)!

var rooms: [(Int, Int)] = []
for _ in 1...number {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    rooms.append((input[0], input[1]))
}
rooms = rooms.sorted(by: { $0.0 < $1.0 })
var ends: [Int] = []
var tempAnswer = 0

for (start, end) in rooms {
    if ends.isEmpty || ends[0] > start {
        tempAnswer += 1
    } else {
        ends.removeFirst()
    }
    maxHeap(&ends, end)
}

print(tempAnswer)

func maxHeap(_ heap: inout [Int], _ number: Int) {
    var first = 0
    var last = heap.count - 1

    if heap.isEmpty {
        heap.append(number)
        return
    }

    while first <= last {
        let middle = (first + last) / 2

        if heap[middle] < number {
            first = middle + 1
        } else {
            last = middle - 1
        }
    }

    heap.insert(number, at: first)
}
