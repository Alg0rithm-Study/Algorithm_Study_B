// Logic
// 1. 현 위치가 섬(1)인 경우 상하좌우 확인
// 2. 상하좌우가 외곽 바깥이거나, 물(0)일 경우 1씩 더해줌

// Solution 
class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let rows = grid.count, cols = grid[0].count
        var result = 0
        
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == 1 {
                    //위
                    if row - 1 == -1 || grid[row-1][col] == 0 {
                        result += 1
                    }
                    //아래
                    if row + 1 == rows || grid[row+1][col] == 0 {
                        result += 1
                    }
                    //좌
                    if col - 1 == -1 || grid[row][col-1] == 0 {
                        result += 1
                    }
                    //우
                    if col + 1 == cols || grid[row][col+1] == 0 {
                        result += 1
                    }
                }
            }
        }  
        
        return result
    }
}
