// 백준 2467. 용액
//


import Foundation
let number = Int(readLine()!)!

var solutions = readLine()!.split(separator: " ").map { Int(String($0))! }


var answer = [Int]()
var left = 0
var right = solutions.count - 1
var temp = Int.max

while left < right {
    let current = solutions[left] + solutions[right]
    if abs(current) <= abs(temp) {
        temp = abs(current)
        answer = []
        answer.append(solutions[left])
        answer.append(solutions[right])
    }
    if current >= 0 {
        right -= 1
    } else if current < 0 {
        left += 1
    }
}

print("\(answer[0]) \(answer[1])")
