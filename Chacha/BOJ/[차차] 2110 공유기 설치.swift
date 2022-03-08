// MARK: - 공유기 설치
// Logic
// 1. 특정 거리를 기준으로 공유기를 둘 수 있는지 개수를 확인하는 로직
// 2. 거리를 기준으로 이분 탐색

// Solution
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let houseCount = input[0], wifiCount = input[1]
var houses = [Int]()

for _ in 0..<houseCount {
    let input2 = Int(readLine()!)!
    houses.append(input2)
}

houses.sort()

func check(with dist: Int) -> Bool {
    var cnt = 1
    var prev = 0
    
    for i in 1..<houseCount {
        if houses[i] - houses[prev] >= dist {
            cnt += 1
            prev = i
        }
    }
    
    return cnt >= wifiCount
}

var lhs = 1 // 최소 거리
var rhs = houses.last! - houses.first! // 최대 가능 거리
var result = 1

while lhs <= rhs {
    let mid = (lhs + rhs) / 2
    
    if check(with: mid) {
        result = max(result, mid)
        lhs = mid + 1
    } else {
        rhs = mid - 1
    }
}

print(result)
