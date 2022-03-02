import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var sortedJobs = jobs.sorted(by: { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] > $1[0] })
    var durations: [[Int]] = [sortedJobs.removeLast()]
    var current: Int = durations[0][0]
    var total = 0 
    while !durations.isEmpty {
        let job = durations.removeLast()
        total += abs(current - job[0]) + job[1]
        current += job[1]
        
        while !sortedJobs.isEmpty && sortedJobs.last![0] <= current {
            durations.append(sortedJobs.removeLast())
        }
        durations.sort(by: { $0[1] > $1[1] })
        
        // 중간에 시간이 빌 때 
        if durations.isEmpty && !sortedJobs.isEmpty {
            durations.append(sortedJobs.removeLast())
            current += current - durations.last![0]
        }
    }
    let result = total / jobs.count
    
    return result 
}

