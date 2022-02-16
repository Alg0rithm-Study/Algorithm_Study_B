// 이분탐색
// 두 수의 합을 기준으로 왼쪽 오른쪽 포인터 이동시키고 
// 절대값을 기준으로 정답을 갱신 시키고

let N = Int(readLine()!)!
let numbers = readLine()!
    .split(separator: " ")
    .compactMap { Int($0) }
    .sorted()

var left = 0
var right = N-1
var leftAnswer = 0
var rightAnswer = 0
var total = Int.max

while left < right {
    let leftNumber = numbers[left]
    let rightNumber = numbers[right]
    let sum = leftNumber + rightNumber
    let absoluteSum = abs(sum)
    
    if absoluteSum <= total {
        leftAnswer = numbers[left]
        rightAnswer = numbers[right]
        total = absoluteSum
        if sum == 0 {
            break
        }
    }
    if sum > 0 {
        right -= 1
    } else {
        left += 1
    }
}

print(leftAnswer, rightAnswer)
