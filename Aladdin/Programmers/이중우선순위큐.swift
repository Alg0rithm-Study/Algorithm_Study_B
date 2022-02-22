import Foundation

@discardableResult
func getMax(from queue: inout [Int]) -> Int {
    queue.sort { $0 < $1 }
    return queue.removeLast()
}

@discardableResult
func getMin(from queue: inout [Int]) -> Int {
    queue.sort {$0 > $1 }
    return queue.removeLast()
}

func solution(_ operations:[String]) -> [Int] {
    var queue: [Int] = []
    
    for operation in operations.map {$0.split(separator: " ") } {
        let command = operation[0], data = Int(operation[1])!
        
        if command == "I" {
            queue.append(data)
        } else if data < 0 && !queue.isEmpty {
            getMin(from: &queue)
        } else if data > 0 && !queue.isEmpty {
            getMax(from: &queue)
        }
    }
    var maxNumber = 0, minNumber = 0
    
    if !queue.isEmpty {
        maxNumber = getMax(from: &queue)
    }
    if !queue.isEmpty {
        minNumber = getMin(from: &queue)
    }
    return [maxNumber, minNumber]
}

