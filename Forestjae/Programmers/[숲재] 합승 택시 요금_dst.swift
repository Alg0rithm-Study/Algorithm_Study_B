import Foundation

// 개선한 풀이 -> 다익스트라를 구현할때 필요한 최소힙, 최대힙을 바이너리서치로 구현해도 된다?

import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var graph = [Int: [Int: Int]]()
    
    for fare in fares {
        graph[fare[0], default: [:]][fare[1]] = fare[2]
        graph[fare[1], default: [:]][fare[0]] = fare[2]
    }
    
    func shortest(from: Int) -> [Int: Int] {
        
        var distMap = [Int: Int]()
        for i in 1...n {
            distMap[i] = Int.max/200
        }
        distMap[from] = 0
             
        var q = [(node: Int, dist: Int)]()
        q.append((from, 0))
        
        while !q.isEmpty {
            let current = q.removeLast()
            
            if distMap[current.node]! < current.dist {
                continue
            }
            if graph.keys.contains(current.node) {
                for (v, w) in graph[current.node]! {
                    let newTime = w + current.dist
                    if newTime < distMap[v]! {
                        distMap[v] = newTime
                        maxHeap(&q, (v, newTime))
                    }

                }
            }
        }
    
        return distMap
    }

    var result = [Int]()
    let starterSet = shortest(from: s) 
    let soleResult = starterSet[a]! + starterSet[b]!
    result.append(soleResult)
    
    
    for depart in 1...n {
        if depart == s {
            continue
        }
        
        let departSet = shortest(from: depart)
        
        result.append(starterSet[depart]! + departSet[a]! + departSet[b]!)
    }
    
    return result.min()!
}


func maxHeap(_ heap: inout [(node: Int, dist: Int)], _ number: (node: Int, dist: Int)) {
    var first = 0
    var last = heap.count - 1

    if heap.isEmpty {
        heap.append(number)
        return
    }

    while first <= last {
        let middle = (first + last) / 2

        if heap[middle].dist > number.dist {
            first = middle + 1
        } else if heap[middle].dist < number.dist {
            last = middle - 1
        } else {
            first = middle
            break
        }
    }

    heap.insert(number, at: first)
}

// 시간초과 풀이 

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var graph = [Int: [Int: Int]]()
    
    for fare in fares {
        graph[fare[0], default: [:]][fare[1]] = fare[2]
        graph[fare[1], default: [:]][fare[0]] = fare[2]
    }
    
    
    func shortest(from: Int) -> [Int: Int] {
        
        var distMap = [Int: Int]()
        
             
        var q = [(node: Int, dist: Int)]()
        q.append((from, 0))
        
        
        while !q.isEmpty {
            let current = q.removeLast()

            if !distMap.keys.contains(current.node) {

                distMap[current.node] = current.dist
                
                if graph.keys.contains(current.node) {
                    
                   
                     for (v, w) in graph[current.node]! {
                    let newTime = w + current.dist
                    maxHeap(&q, (v, newTime))
                }
                }
            }
        }
    
        return distMap
    }

    var result = [Int]()
    let starterSet = shortest(from: s) 
    let soleResult = (starterSet[a] ?? 10000001) + (starterSet[b] ?? 100000001)
    result.append(soleResult)
    
    
    for depart in 1...n {
        if depart == s {
            continue
        }
        
        let departSet = shortest(from: depart)
        
        result.append((starterSet[depart] ?? 100000001) + (departSet[a] ?? 100000001) + (departSet[b] ?? 100000001))
    }
    
    return result.min()!
}


func maxHeap(_ heap: inout [(node: Int, dist: Int)], _ number: (node: Int, dist: Int)) {
    var first = 0
    var last = heap.count - 1

    if heap.isEmpty {
        heap.append(number)
        return
    }

    while first <= last {
        let middle = (first + last) / 2

        if heap[middle].dist > number.dist {
            first = middle + 1
        } else if heap[middle].dist < number.dist {
            last = middle - 1
        } else {
            first = middle
            break
        }
    }

    heap.insert(number, at: first)
}
