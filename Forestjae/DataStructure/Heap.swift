//
//  Heap.swift
//  
//
//  Created by 이승재 on 2022/02/20.
//

import Foundation

struct Heap<T> {
    var nodes = [T]()

    private var orderCriteria: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }

    init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }

    private mutating func configureHeap(from array: [T]) {
        nodes = array

    }

    public var isEmpty: Bool {
        return nodes.isEmpty
    }

    public var count: Int {
        return nodes.count
    }
}

// 최대힙 간략 구현

func maxHeap(_ heap: inout [(target: Int, not: Int)], _ number: (Int, Int) {
    var first = 0
    var last = heap.count - 1

    if heap.isEmpty {
        heap.append(number)
        return
    }

    while first <= last {
        let middle = (first + last) / 2

        if heap[middle].target < number {
            first = middle + 1
        } else {
            last = middle - 1
        }
    }

    heap.insert(number, at: first)
}
