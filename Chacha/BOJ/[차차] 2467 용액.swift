// Logic
// 1. 이분 탐색
// 2. 두 수의 합을 구함
// 3. 두 수의 합에 절대값을 씌워서 result보다 작다면 저장(절대값으로)
// 4. 두 수의 합이 0보다 작다면 left += 1하여 값 증가, 0보다 크다면 right -= 1하여 값 감소
// 5. 두 수의 합이 0이라면 바로 반환하도록 함

// Solution
import Foundation

let input = Int(readLine()!)!
var numbers = [Int]()
var result = Int.max
var liquids = [Int]()

func combineLiquid() -> [Int] {
    var left = 0
    var right = numbers.count - 1

    while left < right {
        let sum = numbers[left] + numbers[right]
        
        if result > abs(sum) {
            result = abs(sum)
            liquids = [left, right]
        }
        
        if sum < 0 {
            left += 1
        } else if sum == 0 {
            return liquids.map { numbers[$0] }
        } else {
            right -= 1
        }
    }
    
    return liquids.map { numbers[$0] }
}

numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

let resultLiquids = combineLiquid()
print("\(resultLiquids[0]) \(resultLiquids[1])")
