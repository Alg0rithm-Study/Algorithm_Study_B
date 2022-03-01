// Logic
// 1. asciiValue: A(65), Z(90)
// 2. A~Z 중간값 보다 작으면 target - start, 크다면 뒤에서 부터 접근하는게 빠르니 end - target만큼 이동 
// 3. 다음 위치 탐색: 쭉 좌/우로 이동하거나, 갔다가 돌아오는 케이스
// 4. 좌측갔다가 우측으로 돌아오는 경우 2 * i - nextIndex + name.count로 계산 가능
// 5. 2 * i는 시작 -> 우 -> 좌의 거리이고, name.count - nextIndex는 우측에 A가 아닌 남아있는 문자의 개수이다
// 6. 우측 먼저 갔다가 좌측 확인하는 경우 (name.count - nextIndex) * 2 + i
// 7. (name.count - nextIndex) * 2은 우측을 먼저 다녀오는 왕복 거리, i는 좌측의 A가 아닌 개수 

// Solution
import Foundation

func solution(_ name:String) -> Int {
    let name = name.map { $0 }
    let start = Int(Character("A").asciiValue!)
    let end = Int(Character("Z").asciiValue!)
    let mid = (end - start) / 2   
    var len = name.count - 1
    var totalCount = 0
    
    for (i, n) in name.enumerated() {
        let target = Int(n.asciiValue!)
        totalCount += min(end - target + 1, target - start)
        
        var nextIndex = i + 1
        while nextIndex < name.count && name[nextIndex] == "A" {
            nextIndex += 1
        } 

        len = min(len, (2 * i) + name.count - nextIndex) // 좌 확인 돌아와서 우 확인
        len = min(len, (name.count - nextIndex) * 2 + i) // 우 확인 돌아와서 좌 확인 
    }
    
    return totalCount + len
}
