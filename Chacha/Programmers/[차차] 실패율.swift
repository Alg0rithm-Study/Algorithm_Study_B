// Logic
// 1. 스테이지별 실패율을 담을 Dictionary 생성
// 2. 도전자 수를 players에 저장 
// 3. 매 스테이지마다 확인
// 4. 스테이지 별 도전중인 플레이어 수를 dictionary에 저장 (배열로 하면 검색에 시간이 O(n)이니 오래 걸려서, dict 검색이 O(1)인 점을 활용)
// 5. 실패율 계산하여 dictioinary에 저장 (분모가 0이 되는 경우는 0으로 넣어줌)
// 6. 로직에 따라 정렬

// Solution 
import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {    
    var failureRate = [Int:Double]()    
    var challenger = Dictionary(stages.map {($0,1)}, uniquingKeysWith: +)
    var players = stages.count
    
    for n in 1...N {
        let losers = challenger[n] ?? 0
        failureRate[n] = players == 0 ? 0 : Double(losers) / Double(players) 
        players -= losers
    }
    
    return failureRate
        .sorted { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value }.map { $0.key }    
}
