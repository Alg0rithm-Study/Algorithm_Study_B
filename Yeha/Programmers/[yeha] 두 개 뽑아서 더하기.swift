// 1. 모든 원소를 돌며 더하고
// 2. 정답열set에 넣고 정렬 후 반환

func solution(_ numbers:[Int]) -> [Int] {
    var answer = Set<Int>()
    for index in 0..<numbers.count {
        for insideIndex in index + 1..<numbers.count{
            answer.insert(numbers[index] + numbers[insideIndex])
        }
    }
    return answer.sorted()
}
