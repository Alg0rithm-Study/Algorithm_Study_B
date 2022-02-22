import Foundation

typealias task = (startTime: Int, duration: Int)

func minify(tasks: inout [task], newTask: task) {
    var left = 0, right = tasks.count - 1
    
    if tasks.isEmpty {
        tasks.append(newTask)
        return
    }
    
    while left <= right {
        let mid = left + (right - left) / 2
        
        if tasks[mid].duration < newTask.duration {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    tasks.insert(newTask, at: left)
}


func solution(_ jobs:[[Int]]) -> Int {
    let jobs = jobs.sorted { (lhs, rhs) -> Bool in
        
        if lhs[0] == rhs[0]{
            return lhs[1]<rhs[1]
        }
        
        return lhs[0] < rhs[0]
    }
    
    var queue: [task] = []
    var count = 0, lastTime = -1, currentTime = 0, total = 0
    
    while count < jobs.count {
        for task in jobs {
            let startTime = task[0], duration = task[1]
            
            if lastTime < startTime && startTime <= currentTime {
                minify(tasks: &queue, newTask: (startTime, duration))
            }
        }
        if !queue.isEmpty {
            let (startTime, duration) = queue.removeLast()
            
            lastTime = currentTime
            currentTime += duration
            total += currentTime - startTime
            count += 1
        } else {
            currentTime += 1
        }
    }
    
    return total / jobs.count
}

