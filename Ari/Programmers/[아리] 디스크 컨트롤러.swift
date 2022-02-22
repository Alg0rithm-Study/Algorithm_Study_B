import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var sortedJobs = jobs.sorted { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1] } // 걸리는 시간이 빠른 순서, 같다면 요청시간이 빠른 순서
    var current = 0 // 작업시간
    var result = 0 // 총 작업 시간
    
    while !sortedJobs.isEmpty {
        for i in 0..<sortedJobs.count {
            let request = sortedJobs[i][0] // 요청시간
            let working = sortedJobs[i][1] // 작업 소요 시간
            
            if request <= current { // 요청시간이 작업시간보다 작거나 같다면
                current += working // 작업을 곧바로 진행하기
                result += current - request // 현재 작업시간 - 요청시간 = 걸린 시간
                sortedJobs.remove(at: i) // 완료된 작업 제거
                break
            }
            
            if i == sortedJobs.count - 1 { // 만약 아무런 작업을 하지못해서 끝까지 온 경우 작업시간을 늘려준다.
                current += 1
            }
        }
    }
   
    return result / jobs.count
}
