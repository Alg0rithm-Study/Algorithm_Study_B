import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    // 각 유저는 한번에 한명의 유저를 신고할 수 있다.
    // 동일한 유저에 대한 신고 횟수는 1회로 처리
    // k번 이상 신고된 유저는 게시판 이용 정지, 신고한 모든 유저에게 메일로 공지
    
    var reportedList = [String: [String]]() // 신고한 유저리스트
    var reportedUsers = [String: Int]() // 신고당한 유저들
    var result = Array(repeating: 0, count: id_list.count)
    
    for value in Set(report) {
        let info = value.split(separator: " ")
        let from = info[0].description
        let to = info[1].description
        
        if reportedList[from] == nil {
            reportedList[from] = [to]
        } else {
            reportedList[from]!.append(to)
        }
        
        if reportedUsers[to] == nil {
            reportedUsers[to] = 1
        } else {
            reportedUsers[to]! += 1
        }
    }
    
    let suspension = reportedUsers.filter { $0.value >= k }.keys

    for (index, id) in id_list.enumerated() {

        if let element = reportedList[id] {
            result[index] = Set(element).intersection(Set(suspension)).count // 교집합 활용 
        }
        
    }
    return result
}
