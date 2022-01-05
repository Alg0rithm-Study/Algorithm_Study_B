// Logic
// 1. i번째의 경우 i+1..<전체 길이 만큼만 신경써주고 더해주면 된다.
// 2. 수의 합은 Set에 insert하여 중복 방지
// 3. 오름차순 정렬하여 리턴

// Solution
import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result = Set<Int>()
    
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count {
            result.insert(numbers[i] + numbers[j])
        }
    }
    
    return result.sorted { $0 < $1 }
}
