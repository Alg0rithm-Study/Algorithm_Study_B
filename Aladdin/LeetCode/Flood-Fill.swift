/**
bfs 풀이
원래의 color 저장 해뒀다가
탐색하면서 같은 색 만나면 새로운 색으로 바꿔주고 큐에 넣는다
*/

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let xBorder = image.count
        let yBorder = image[0].count
        let dx = [1, -1, 0, 0]
        let dy = [0, 0, 1, -1]
        let oldColor = image[sr][sc]
        var newImage = image
        var queue: [(Int, Int)] = []
        var visited = Array(repeating: Array(repeating: false, count: yBorder), count: xBorder)
        var pointer = 0
        
        visited[sr][sc] = true
        newImage[sr][sc] = newColor
        queue.append((sr, sc))
        
        while pointer < queue.count {
            let (x, y) = queue[pointer]
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                guard 0 <= nx && nx < xBorder && ny >= 0 && ny < yBorder,
                      !visited[nx][ny] else {
                          continue
                      }
                visited[nx][ny] = true
                if newImage[nx][ny] == oldColor {
                    newImage[nx][ny] = newColor
                    queue.append((nx, ny))
                }
            }
            
            pointer += 1
        }
        
        return newImage
    }
}
