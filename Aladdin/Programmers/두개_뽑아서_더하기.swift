//1. 0~numbers.count 까지 모든 인덱스를 기준으로
// 모든 가능한 인덱스를 짝지어서 더한 값을 배열에 추가해준다.

// 2. 완성 된 배열을 Set으로 중복 원소를 제거해준다.
// 3. 정렬해서 리턴한다.
import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var answer: [Int] = []
    
    for i in 0..<numbers.count - 1 {
        for j in i+1..<numbers.count {
            let sum = numbers[i] + numbers[j]
			answer.append(sum)
        }
    }
    return Array(Set(answer)).sorted()
}
