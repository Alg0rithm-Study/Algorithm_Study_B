import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var sumArray: [Int] = []
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            let newNumber = numbers[i] + numbers[j]
            if !sumArray.contains(newNumber) {
                sumArray.append(newNumber)
            }
        }
    }
    return sumArray.sorted()
}
