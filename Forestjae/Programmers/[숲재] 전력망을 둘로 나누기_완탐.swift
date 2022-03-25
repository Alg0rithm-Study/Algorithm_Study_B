import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    
    var answer = [Int]()
    for i in 0..<wires.count {
        let unConnected = wires.filter { $0 != wires[i] }   
        
        var dict: [Int: [Int]] = [:]
        for un in unConnected {
            if dict.keys.contains(un[0]) {
                dict[un[0], default: []].append(un[1])
            } else {
                dict[un[0]] = [un[1]]
            }

            if dict.keys.contains(un[1]) {
                dict[un[1], default: []].append(un[0])
            } else {
                dict[un[1]] = [un[0]]
            }
        }
        var queue = [unConnected[0][0]]
        
        var count = 0
        var visit: [Int: Bool] = [:]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let nextNodes = dict[node]!
            nextNodes.forEach { node in
                if visit[node, default: false] == false {
                    queue.append(node)
                    count += 1
                    visit[node] = true
                } 
            }            
        }
        answer.append(abs(n - count - count))
    }
    return answer.min()!
}