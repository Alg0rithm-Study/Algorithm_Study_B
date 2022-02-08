/**
BFS 풀이

1. 치즈가 아닌 공기에 대해서만 탐색한다
2. 공기가 탐색을 만나면 치즈를 공기로 바꾸고 count 더해준다
3. 치즈가 다 없어질때까지 반복하면서 마지막 치즈 상태랑 총 소요 시간을 기록한다
*/

func bfs(grid: inout [[Int]], visited: inout [[Bool]]) -> Int {
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    var queue: [(Int, Int)] = []
    var pointer = 0
    var count = 0
    
    queue.append((0, 0))
    
    while pointer < queue.count {
        let (x, y) = queue[pointer]
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 > nx || nx >= grid.count || 0 > ny || ny >= grid[0].count ||
                visited[nx][ny] {
                continue
            }
            visited[nx][ny] = true
            // 치즈
            if grid[nx][ny] == 1 {
                grid[nx][ny] = 0 // 냠냠
                count += 1
            } else {
                queue.append((nx, ny))
            }
        }
        pointer += 1
    }
    
    return count
}

let NM = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = NM[0]
let M = NM[1]
var grid: [[Int]] = []

for _ in 0..<N {
    let array = readLine()!.split(separator: " ").compactMap { Int($0) }
    grid.append(array)
}

var previous = 0
var time = 0

while true {
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    visited[0][0] = true
    let count = bfs(grid: &grid, visited: &visited)
    
    if count == 0 {
        break
    }
    previous = count
    time += 1
}

print(time)
print(previous)
