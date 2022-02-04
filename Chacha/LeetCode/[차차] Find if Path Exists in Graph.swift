// Logic 
// 1. 시작점과 연결된 도착지를 배열에 당기 (다음 출발지가 됨, 양방향이라는 점을 감안해야함)
// 2. dfs로 계속 다음으로 이동하면서 destination과 같다면 true, 아니라면 false 반환
// 3. 중복된 edge가 있으면 안되니 방문한 edge는 기억하도록 함 

// Solution
class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var visited = Set<Int>()
        var paths = [[Int]](repeating: [], count: n)
        
        for edge in edges {
            paths[edge[0]].append(edge[1])
            paths[edge[1]].append(edge[0])
        }
        
        var willVisit = [Int]()
        willVisit.append(source)
        
        while !willVisit.isEmpty {
            let next = willVisit.removeLast() 
            
            if next == destination {
                return true
            }
            
            visited.insert(next)
            
            for path in paths[next] {
                if !visited.contains(path) {                    
                    willVisit.append(path)
                }
            }
        }
        
        return false
    }
}
