// Logic
// 1. 범위내 숫자 + 지울 수 있는 범위여야 계속 진행하도록 함
// 2. 가장 마지막 숫자를 가지고 들어올 숫자와 비교함
// 3. 처음에 아무것도 없을 때는 추가해주고 idx + 1
// 3. 들어올 숫자가 크다면 우선 기존 마지막 숫자를 제거하고 삭제 개수 증가
// 4. 들어올 숫자가 더 작다면 우선 추가하고 idx + 1
// 5. 조건문을 벗어났는데, 주어진 삭제개수만큼 삭제 못한 경우는 뒤에서 부터 아직 삭제 못한 개수만큼 자르기 
// 6. idx가 아직 남은 경우는 idx부터 남은 숫자들 추가 

// Solution
import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var number = number.map { String($0) } 
    var idx = 0, deleted = 0
    var maxNum = [String]()
    
    while deleted < k && idx < number.count {
        guard let last = maxNum.last else {
            maxNum.append(number[idx])
            idx += 1
            continue
        }
        
        if last < number[idx] {
            maxNum.removeLast()
            deleted += 1 
            continue
        } else {
            maxNum.append(number[idx])
            idx += 1            
        }        
    }
    
    if deleted < k {
        maxNum = Array(maxNum[0..<maxNum.count-(k-deleted)])
    } else if deleted == k {
        maxNum.append(contentsOf: number[idx...])
    }
    
    return maxNum.joined()
}
