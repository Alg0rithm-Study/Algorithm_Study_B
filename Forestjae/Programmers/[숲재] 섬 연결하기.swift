import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var isConnected: Set<Int> = [costs[0][0]]
    var total = 0
    var costs = costs.sorted(by: { $0[2] < $1[2] })
    // visited 배열로 최적화 해보기
    while isConnected.count != n {
        for (idx, cost) in costs.enumerated() {
            if isConnected.contains(cost[0]) && isConnected.contains(cost[1]) {
                continue
            } else if isConnected.contains(cost[0]) || isConnected.contains(cost[1]) {
                isConnected.insert(cost[0])
                isConnected.insert(cost[1])
                total += cost[2]
                costs[idx] = [-1, -1, 0]
                break
            }
        }
    }

    return total
}