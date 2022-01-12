// Logic
// 1. 0 ~ 9 까지 numbers에 들어가지 않는 숫자 필터링
// 2. 합하기


// Solution
import Foundation

func solution(_ numbers:[Int]) -> Int {
    return (0..<10).filter { !numbers.contains($0) }.reduce(0,+)
}
