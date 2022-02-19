// Logic 
// 1. SJF(Shortest Job First)
// 2. 작업 시간 순으로 정렬하되, 같은 경우 요청 시간 순으로 정렬
// 3. 요청이 현재 시간 보다 빠르다면, 무조건 처리해준다. 
// 4. 요청 시간이 현재 시간보다 빠른 작업이 없다면 +1 이동 

// Solution
import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var totalProcessingTime = 0
    var currentTime = 0        
    var sortedJobs = jobs.sorted { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1] }
    
    while !sortedJobs.isEmpty {
        for i in 0..<sortedJobs.count {
            let startTime = sortedJobs[i][0]
            let processingTime = sortedJobs[i][1]
            
            if startTime <= currentTime {
                currentTime += processingTime
                totalProcessingTime += (currentTime - startTime)
                sortedJobs.remove(at: i)
                break
            }
            
            if i == sortedJobs.count - 1 {
                currentTime += 1 
            }
        }
    }
    
    return totalProcessingTime / jobs.count
}
