// Shortest Job First 최단 작업 우선 스케줄링 관련
// 우선순위 큐 사용하지 않음
// 정렬하여 우선 순위 높은(먼저 도착하는, 빨리 끝나는) 데이터를 가장 끝으로 보내 먼저 처리
//
// 1. 가장 먼저 도착한 작업을 처리한다
// 2. 작업을 처리하는 동안 도착하는 작업을 큐에 넣는다
// 3. 큐에 있는 작업 중 수행시간이 짧은 작업을 처리
// 4. 큐에 작업이 없고, 아직 도착해야 할 작업이 있는 상태라면 가장 빨리 도착하는 작업 처리
// 5. 2-4번 과정 반복

func solution(_ jobs:[[Int]]) -> Int {
    var sortedJobs = jobs.sorted {
        if $0[0] == $1[0] {
            return $0[1] > $1[1]
        } else {
            return $0[0] > $1[0]
        }
    }
    var jobQueue = [sortedJobs.removeLast()]
    var currentTime = jobQueue.first![0]
    var totalTime = 0

    while !jobQueue.isEmpty {
        let now = jobQueue.removeLast()
        totalTime += abs(currentTime - now[0]) + now[1]
        currentTime += now[1]
        
        while !sortedJobs.isEmpty && sortedJobs.last![0] <= currentTime {
            jobQueue.append(sortedJobs.removeLast())
        }
        jobQueue.sort { $0[1] > $1[1] }
        
        if jobQueue.isEmpty && !sortedJobs.isEmpty {
            jobQueue.append(sortedJobs.removeLast())
            currentTime += abs(currentTime - jobQueue.last![0])
        }
    }
    return totalTime / jobs.count
}
