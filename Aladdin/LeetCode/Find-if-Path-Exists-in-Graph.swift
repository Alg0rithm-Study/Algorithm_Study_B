/**
dfs 풀이
1. edges 를 각 정점: [간선] 형태로 변환
2. dfs 
    - destination 만나면 answer 를 true로 바군다
*/


class Solution {
    func dfs(graph: [[Int]], visited: inout [Bool], current: Int, destination: Int, answer: inout Bool) {
        if current == destination {
            answer = true
            return
        }
        visited[current] = true
        
        for _next in graph[current] {
            if visited[_next] {
                continue
            }
            dfs(graph: graph, visited: &visited, current: _next, destination: destination, answer: &answer)
        }
    }
    
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var visited = Array(repeating: false, count: n)
        var graph = [[Int]](repeating: [], count: n)
        
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        
        var answer = false
        dfs(graph: graph, visited: &visited, current: source, destination: destination, answer: &answer)
        
        return answer
    }
}

