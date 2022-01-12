// 1. 0~9 까지의 range 와 numbers 를 Set으로 바꿔서
// 2. 둘의 차집합으로 numbers에서 빠져있는 숫자를 구한 뒤
// 3. sum 구하기
import Foundation

func solution(_ numbers:[Int]) -> Int {
    return Set(0..<10)
    .subtracting(Set(numbers))
    .reduce(0, +)
}
