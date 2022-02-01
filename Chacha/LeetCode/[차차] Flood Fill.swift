// Logic 
// 1. 4-방향을 미리 생성해둠
// 2. 정해둔 현재 값을 미리 저장해둠(주변에 이 값과 비슷한 값을 찾아야 함)
// 3. newColor가 현재 값과 같다면 바로 현재 image 반환
// 4. 우선 현재 위치 먼저 칠하기
// 5. 현재 기준으로 상하좌우의 값이 우선 범위 내인지, 값이 동일한지 파악
// 6. 5번 조건에 부합한다면 새로운 색으로 칠하고 다음 위치로 이동시키기

// Solution 
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let directions = [0,-1,0,1,0]
        let target = image[sr][sc]
        var image = image 
        
        if image[sr][sc] == newColor {
            return image
        }
        
        let rows = image.count, cols = image[0].count
        
        image[sr][sc] = newColor
        dfs(&image, directions, (sr,sc), target, newColor)
        
        return image
    }
    
    func dfs(_ image: inout [[Int]], _ directions: [Int], _ start: (Int,Int), _ target: Int, _ newColor: Int) {
        var nextVisit = [(Int, Int)]()
        nextVisit.append(start)
        
        while !nextVisit.isEmpty {
            let point = nextVisit.removeLast()
            
            for i in 0..<4 {
                let newX = point.0 + directions[i]
                let newY = point.1 + directions[i+1]
                
                if (newX >= 0 && newX < image.count) && (newY >= 0 && newY < image[0].count) {
                    if image[newX][newY] == target {
                        image[newX][newY] = newColor
                        nextVisit.append((newX, newY))      
                    }                    
                }
            }
        }
    }
}
