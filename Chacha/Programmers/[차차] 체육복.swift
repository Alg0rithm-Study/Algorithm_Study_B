// Logic 
// 1. 여벌 있는 본인도 도난 가능 -> 본인에게 
// 2. reserve에 속하지 않는 lost 필터링
// 3. lost에 속하지 않는 reserve에 필터링
// 4. -1 , +! 에 포함되지 않는지 확인, 포함되는 경우 lost애 확인 표시 및 명수 줄여주기

// Solution
import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var filteredlost = lost.filter { !reserve.contains($0) }.sorted { $0 < $1 }   
    var filteredReserve = reserve.filter { !lost.contains($0) }.sorted { $0 < $1 }
    var lostCount = filteredlost.count
    
    for res in filteredReserve {
        for i in 0..<filteredlost.count {
            if filteredlost[i] == 0 {
                continue
            }
            if [filteredlost[i]-1, filteredlost[i]+1].contains(res) {
                filteredlost[i] = 0
                lostCount -= 1
                break
            }
        }
    }
    
    return n - lostCount
}
