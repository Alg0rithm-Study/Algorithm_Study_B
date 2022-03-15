import Foundation

let NM = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = NM[0]
let M = NM[1]
let trees = readLine()!.split(separator: " ").compactMap { Int($0) }

var left = 0, right = trees.max()!
var answer = 0

func cut(trees: [Int], height: Int) -> Int {
    var total = 0
    
    for tree in trees {
        if tree > height {
            total += tree - height
        }
    }
    return total
}

while left <= right {
    let height = left + (right - left) / 2
    let cutDifference = cut(trees: trees, height: height)
    
    if cutDifference >= M {
        answer = max(height, answer)
        left = height + 1
    } else {
        right = height - 1
    }
}

print(answer)


