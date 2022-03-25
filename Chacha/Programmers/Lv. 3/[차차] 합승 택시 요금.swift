import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    let maxValue = 200 * 100000 + 1
    var pathCosts = Array(repeating: Array(repeating: maxValue, count: n), count: n)    
    
    for fare in fares {
        let start = fare[0] - 1, end = fare[1] - 1, cost = fare[2]
        pathCosts[start][end] = cost
        pathCosts[end][start] = cost
    }
    
    for i in 0..<n {
        for j in 0..<n where i != j || pathCosts[j][i] != maxValue {
            for k in 0..<n where j != k {
                pathCosts[j][k] = min(pathCosts[j][k], pathCosts[j][i] + pathCosts[i][k])
            }
        }
    }
    
    var minCost = pathCosts[s-1][a-1] + pathCosts[s-1][b-1]
    
    for mid in 0..<n {        
        let midCost = pathCosts[s-1][mid]
        let aCost = a-1 == mid ? 0 : pathCosts[mid][a-1]
        let bCost = b-1 == mid ? 0 : pathCosts[mid][b-1]
        let indirectCost = midCost + aCost + bCost
        minCost = min(minCost, indirectCost)
    }
    
    return minCost
}
