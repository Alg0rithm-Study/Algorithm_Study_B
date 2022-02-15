let n = Int(readLine()!)!
let s = readLine()!.split(separator: " ").map { Int($0)! }
var answer = (0, 0)

var left = 0
var right = s.count - 1
var sum = 0
var smallestSum = Int.max

while left < right {
    sum = s[left] + s[right]

    if abs(sum) < smallestSum {
        smallestSum = abs(sum)
        answer = (s[left], s[right])
    }
    if sum > 0 {
        right -= 1
    } else if sum < 0 {
        left += 1
    } else {
        answer = (s[left], s[right])
        break
    }
}

print("\(answer.0) \(answer.1)")


