import Foundation

// 문제 핵심: MST 찾아서 비용 합한게 정답
// 최소 비용 간선부터 하나씩 cycle 인지 확인하고
// 아니면 최소 간선이니까 정답에 추가

func unionFind(parents: [Int], node: Int) -> Int {
    return parents[node] == node ? node : unionFind(parents: parents, node: parents[node])
}

func update(parents: inout [Int], a: Int, b: Int) {
    let aParent = unionFind(parents: parents, node: a)
    let bParent = unionFind(parents: parents, node: b)
    
    if aParent < bParent {
        parents[bParent] = aParent
    } else {
        parents[aParent] = bParent
    }
}

func isCycle(a: Int, b: Int, parents: [Int]) -> Bool {
    let aParent = unionFind(parents: parents, node: a)
    let bParent = unionFind(parents: parents, node: b)
    
    return aParent == bParent
}

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    let costs = costs.sorted { $0[2] < $1[2] }
    var parentNodes = [Int](repeating: 0, count: n)
    var answer = 0, edgeCount = 0
    
    for i in 0..<n {
        parentNodes[i] = i
    }
    
    for data in costs {
        let a = data[0], b = data[1], cost = data[2]
        
        if !isCycle(a: a, b: b, parents: parentNodes) {
            answer += cost
            update(parents: &parentNodes, a: a, b: b)
            edgeCount += 1
        }
        
        if edgeCount == n - 1 {
            break
        }
    }
    return answer
}
