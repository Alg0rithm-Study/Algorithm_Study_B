class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var dict = [Int: [(Int, Int)]]()

        /* dict default의 활용
        for time in times {
            dict[time[0], default: [:]][time[1]] = time[2]
        }
        */
        for i in 0..<times.count {
            if dict.keys.contains(times[i][0]) {
                dict[times[i][0]]!.append((times[i][1], times[i][2]))
            } else {
                dict[times[i][0]] = [(times[i][1], times[i][2])]
            }
        }

        
        
        var queue = [(0, k)]
        var dist = [Int:Int]()

        // 튜플에 이름 붙여주기 
        // var q: [(node: Int, dist: Int)] = []
        
        while !queue.isEmpty {
            let first = queue.removeFirst()
            let time = first.0
            let node = first.1
            
            if !dist.keys.contains(node) {
                dist[node] = time
                if dict.keys.contains(node) {
                    for (v, w) in dict[node]! {
                    let newTime = w + time
                    queue.append((newTime, v))
                    queue = queue.sorted(by: { $0.0 < $1.0})
                }
                }
                
            }
        }
        
        if dist.count == n {
            return dist.values.max()!
        }
        
        
        return -1
    }
}