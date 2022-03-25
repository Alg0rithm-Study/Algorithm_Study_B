import Foundation

let input  = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let number = input[0]
let target = input[1]

// 여기서 componets를 사용해서 분리하면 시간초과
let trees = readLine()!.split(separator: " ").compactMap { Int(String($0)) }


func cutTree(at height: Int) -> Int {
    var result = 0
    trees.forEach { tree in
        let piece = tree - height
        if piece > 0 {
            result += piece
        }
    }
    return result
}

var left = 0
var right = trees.max()!
var mid = 0
var answer = -1
var temp = -1

while left < right {
    mid = (left + right) / 2
    temp = cutTree(at: mid)

    if temp < target {
        right = mid
    } else {
        answer = mid
        left = mid + 1
    }
}

print(answer)
