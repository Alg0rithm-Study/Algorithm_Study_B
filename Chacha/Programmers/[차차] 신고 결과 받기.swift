// Logic
// 1. [신고당한 유저: 횟수] 딕셔너리 생성 
// 2. [신고자: 신고대상자] 딕셔너리 생성
// 3. 신고대상자 중 정지당한 사람의 수를 배열로 표시한 게 답이 됨 (순서는 id_list의 순서)

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportedUser = [String: Int]()
    var reporter = [String: [String]]()
    var result = [Int]()
    
    Set(report).forEach {
        let info = $0.components(separatedBy: " ")
        let from = info[0], to = info[1]
        
        if let _ = reportedUser[to] {
            reportedUser[to]! += 1
        } else {
            reportedUser[to] = 1
        }
        
        if let _ = reporter[from] {
            reporter[from]!.append(to)
        } else {
            reporter[from] = [to]
        }
    }
    
    let paused = Set(reportedUser.filter { $0.value >= k }.keys)
    
    for id in id_list {
        if let value = reporter[id] {
            result.append(Set(value).intersection(paused).count)
        } else {
            result.append(0)
        }
    }
    
    return result
}
