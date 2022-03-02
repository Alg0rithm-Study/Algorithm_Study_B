//
//  [숲재] 이중우선순위 큐.swift
//  
//
//  Created by 이승재 on 2022/02/23.
//

import Foundation

// MARK: - 최대힙을 이용한 풀이

import Foundation

func solution(_ operations:[String]) -> [Int] {
    var operations = operations
    operations.reverse()
    var heap: [Int] = []

    while operations.count != 0 {
        let operation = operations.removeLast()
        let seperated = operation.components(separatedBy:" ")
        let alpha = seperated[0]
        let number = Int(seperated[1])!

        switch alpha {
        case "I":
            maxHeap(&heap, number)
        case "D":
            if heap.isEmpty {
                continue
            }
            else if number == 1 {
                heap.removeLast()
            } else {
                heap.removeFirst()
            }
        default:
            continue
        }

    }

    return heap.isEmpty ? [0, 0] : [heap.max()!, heap.min()!]
}

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


// MARK: - sort()를 활용한 풀이

import Foundation

func solution(_ operations:[String]) -> [Int] {
    var operations = operations
    operations.reverse()
    var queue: [Int] = []

    while operations.count != 0 {
        let operation = operations.removeLast()
        let seperated = operation.components(separatedBy:" ")
        let alpha = seperated[0]
        let number = Int(seperated[1])!

        switch alpha {
        case "I":
            insert(number, to: &queue)
            queue.sort()
        case "D":
            if queue.isEmpty {
                continue
            }
            delete(number, in: &queue)
        default:
            print("")
        }
    }

    return queue.isEmpty ? [0, 0] : [queue.max()!, queue.min()!]
}

func insert(_ number: Int, to queue: inout [Int]) {
    queue.append(number)
}

func delete(_ options: Int, in queue: inout [Int]) {
    if options == 1 {
        queue.removeLast()
    } else {
        queue.remove(at:0)
    }
}
