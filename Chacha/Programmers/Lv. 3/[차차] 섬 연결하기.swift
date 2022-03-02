// Logic 
// 1. Kruskal 알고리즘 (union-find)
// 2. 사이클 그래프를 먼저 생성한다. 그리고 각 인덱스에 연결된 부모 노드(최소)를 저장 
// 3. 간선들을 오름차순으로 정렬 
// 4. 각 노드 기준 연결된 간선들을 오름차순으로 추가
// 5. findParent를 통해 cycle이 발생하지 않는 경우에만 비용 추가, 그 이후 unionParent 진행

// Solution
import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    let roadCosts = costs.sorted { $0[2] < $1[2] }
    var cycle = Array<Int>(0..<n)
    var minCost = 0
    
    for roadCost in roadCosts {
        let start = roadCost[0], end = roadCost[1], cost = roadCost[2]
        
        if !findParent(&cycle, start, end) {
            minCost += cost
            unionParent(&cycle, start, end)
        }
    }
    
    return minCost
}

func getParent(_ parent: inout [Int], _ node: Int) -> Int {
    if parent[node] != node {
        parent[node] = getParent(&parent, parent[node])
    }
    
    return parent[node]
}

func unionParent(_ parent: inout [Int], _ nodeA: Int, _ nodeB: Int) {
    let a = getParent(&parent, nodeA)
    let b = getParent(&parent, nodeB)
    
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

func findParent(_ parent: inout [Int], _ nodeA: Int, _ nodeB: Int) -> Bool {
    let a = getParent(&parent, nodeA)
    let b = getParent(&parent, nodeB)
    
    return a == b
}



