// MARK: - 나무 자르기
// Logic
// 1. 오름차순 정렬
// 2. 최소 ~ 최대 배열에서 이분탐색
// 3. 잘린 나무 총 길이가 타겟보다 길다면 좌측 인덱스를 중간값 위치로
// 4. 잘린 나무 총 길이가 타겟보다 작다면 우측 인덱스를 중간값 위치로

// Solution
import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
let cnt = input[0], target = input[1]
let trees = readLine()!.split(separator: " ").compactMap { Int(String($0))! }.sorted { $0 < $1 }

var lhs = 0, rhs = trees.max()!
var result = 0

while lhs <= rhs {
    let mid = (lhs + rhs) / 2
    var sum = 0
    trees.forEach {
        if $0 - mid > 0 {
            sum += ($0 - mid)
        }
    }
    
    if sum < target {
        rhs = mid - 1
    } else {
        result = max(result, mid)
        lhs = mid + 1
    }
}

print(result)
