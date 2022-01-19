import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var failure = [Int: Float]()
    var challenger = Array(repeating: 0, count: N + 1)
    // out of range 에러를 피하기 위해(스테이지를 끝까지 클리어한 사용자를 고려) +1 해줌.
    
    // 스테이지 별 도전한 사용자 수를 stages를 조회하며 구하기
    for stage in stages {
        for i in 0..<stage {
            challenger[i] += 1
        }
    }
    
    for i in 0..<N {
        var notClear = challenger[i] - challenger[i+1] 
        // 현재 스테이지 도전자 - 다음 스테이지 도전자 = 클리어하지 못한 사용자
        failure[i+1] = notClear != 0 ? Float(notClear) / Float(challenger[i]) : 0 
        // 0으로 나눌 수 없으므로 삼항연산자로 조건 걸어주기
    }
    let result = failure.sorted(by: <).sorted { $0.value > $1.value }.map{ $0.key }
    // key값 기준 오름차순 정렬 후 실패값인 value 기준으로 내림차순 정렬 후 key값으로 배열만들기
    
    return result
}
