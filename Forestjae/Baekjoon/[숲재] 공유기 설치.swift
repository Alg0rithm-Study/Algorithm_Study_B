import Foundation

let input  = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let houseCount = input[0]
let modemCount = input[1]

var houses = [Int]()

(0...houseCount - 1).forEach { _ in
    houses.append(Int(readLine()!)!)
}
houses = houses.sorted(by: { $0 < $1 })

// 주어진 숫자만큼의 공유기 설치가 가능한지 판별
func isValid(target: Int) -> Bool {
    var current = houses[0]
    var count = 1
    for index in (1..<houses.count) {
        if houses[index] - current >= target {
            count += 1
            current = houses[index]
        }
    }
    let result = count >= modemCount ? true : false
    return result
}

var left = 0
var right = houses.last! - houses.first!
var mid = 0
var answer = 0

// 0 과 최대 거리 사이의 바이너리 서치 진행
while left <= right {
    mid = (left + right) / 2
    if isValid(target: mid) {
        left = mid + 1
        answer = max(answer, mid)
    } else {
        right = mid - 1
    }
}

print(answer)
