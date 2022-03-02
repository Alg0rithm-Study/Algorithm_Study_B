import Foundation

let cheese = 1
let melted = -1
let air = 0

var n = 0, m = 0
var arr = Array(repeating: [Int](), count: 100)
var visit = [[Bool]]()

func dfs(row: Int, col: Int) {
    visit[row][col] = true
    arr[row][col] = air

    let adjacents = [(row+1, col), (row-1, col), (row, col+1), (row, col-1)].filter {
        (0..<n) ~= $0.0 && (0..<m) ~= $0.1
    }

    for adjacent in adjacents {
        let adjacentX = adjacent.0
        let adjacentY = adjacent.1

        guard !visit[adjacentX][adjacentY] && arr[adjacentX][adjacentY] != cheese else { continue }
        dfs(row: adjacentX, col: adjacentY)
    }
}

func contactWithAir() {
    visit = Array(repeating: Array(repeating: false, count: 100), count: 100)
    dfs(row: 0, col: 0)
}

func meltCheese() {
    for row in 0..<n {
        for col in 0..<m {
            guard arr[row][col] == cheese else { continue }

            let adjacents =  [(row+1, col), (row-1, col), (row, col+1), (row, col-1)].filter {
                (0..<n) ~= $0.0 && (0..<m) ~= $0.1
            }
            let adjacentsAir = adjacents.filter { arr[$0.0][$0.1] == air }

            if adjacentsAir.count >= 2 { arr[row][col] = melted }
        }
    }
}

func noCheese() -> Bool {
    for i in 0..<n {
        for j in 0..<m {
            if arr[i][j] == cheese { return true }
        }
    }

    return true
}

func solution() {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    n = input[0]
    m = input[1]

    for i in 0..<n {
        arr[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
    }

    var count = 0

    while noCheese() {
        contactWithAir()
        meltCheese()

        count += 1
    }

    print(count)
}

solution()
