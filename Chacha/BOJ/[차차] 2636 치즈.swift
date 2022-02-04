// Logic
// 1. (0,0)에서 시작하여 발견되는 1이 외곽에 해당하는 치즈이다.
// 2. 이에 해당 치즈들을 배열에 담아두고 한 번에 0으로 바꿔준다.
// 3. 제거한 이후 현재 치즈의 개수를 배열에 담아둔다.
// 4. 치즈가 사라질 때 까지 위 과정을 반복한다.

// Solution
import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let row = input[0], col = input[1]
let directions = [0,-1,0,1,0]
var cheese = [[Int]](repeating: [], count: row)
var currentCheeseCount = [Int]()
var visited = Array(repeating: Array(repeating: false, count: col), count: row)
var outerCheese = [(Int, Int)]()

func checkAndRemoveCheese() {
    outerCheese = [(Int, Int)]()
    visited = Array(repeating: Array(repeating: false, count: col), count: row)
    bfs((0,0))
    meltCheese(outerCheese, &cheese)
}

func bfs(_ start: (Int, Int)) {
    var willVisit = [(Int, Int)]()
    willVisit.append(start)

    while !willVisit.isEmpty {
        let next = willVisit.removeFirst()

        for i in 0..<4 {
            let newX = next.0 + directions[i]
            let newY = next.1 + directions[i+1]
            
            if (newX < row && newX >= 0) && (newY < col && newY >= 0) {
                if cheese[newX][newY] == 0 && !visited[newX][newY] {
                    visited[newX][newY] = true
                    willVisit.append((newX, newY))
                } else if cheese[newX][newY] == 1 {
                    outerCheese.append((newX, newY))
                }
            }
        }
    }
}

func meltCheese(_ outer: [(Int, Int)], _ arr: inout [[Int]]) {
    for (x,y) in outer {
        arr[x][y] = 0
    }
}

func retrieveRemainCheese(_ arr: [[Int]]) -> Int {
    return arr.map { $0.reduce(0,+) }.reduce(0,+)
}


for i in 0..<row {
    let input2 = readLine()!.split(separator: " ").map{ Int(String($0))! }
    cheese[i] = input2
}

currentCheeseCount.append(retrieveRemainCheese(cheese))

while currentCheeseCount.last != 0 {
    checkAndRemoveCheese()
    currentCheeseCount.append(retrieveRemainCheese(cheese))
}

print(currentCheeseCount.count - 1)
print(currentCheeseCount[currentCheeseCount.count - 2])
