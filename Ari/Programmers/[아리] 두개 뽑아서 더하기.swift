import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    var result: Set<Int> = []
    
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            result.insert(numbers[i] + numbers[j])
        }
    }
    
    return Array(result).sorted()
}
