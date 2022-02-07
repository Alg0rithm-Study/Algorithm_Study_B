// 1. 땅만 큐에 넣고 visited 도 표시한다
// 2. BFS 돌린다
//  - Perimeter
//    - 땅 -> Border
//    - 땅 -> 물 
//  - 땅 -> 땅 만 큐에 넣고 visited 표시 해준다

class Solution {
    func bfs(grid: [[Int]], queue: [(Int, Int)], visited: [[Bool]]) -> Int {
        var queue = queue
        var visited = visited
        let dx = [0, 0, 1, -1]
        let dy = [1, -1, 0, 0]
        var pointer = 0
        var answer = 0
        
        while pointer < queue.count {
            let (x, y) = queue[pointer]
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || nx >= grid.count || ny < 0 || ny >= grid[0].count { // 땅 -> Border
                    answer += 1
                    continue
                }
                if visited[nx][ny] { // 이미 방문
                    continue
                }
                if grid[nx][ny] == 0 { // 땅 -> 물
                    answer += 1
                } else { // 땅 -> 땅
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                }
            }
            pointer += 1
        }
        return answer
    }

    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var queue: [(Int, Int)] = []
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)

        for x in 0..<grid.count { // 땅만 큐에 저장
            for y in 0..<grid[0].count {
                if grid[x][y] == 1 {
                    queue.append((x, y))
                    visited[x][y] = true
                }
            }
        }
        
        return bfs(grid: grid, queue: queue, visited: visited)
    }
}

