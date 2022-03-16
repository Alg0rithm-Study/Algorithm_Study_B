

let input = readLine()
func solution(_ input: String) -> String {
    var result = Int.max
    var unique = [Int]()
    let solutions = input.split(separator: " ").compactMap{ Int($0) }
    var start = 0
    var end = solutions.count - 1
    
    while start < end {
        let value = solutions[start] + solutions[end] // 두 용액을 혼합
        
        result = min(result, abs(value)) // 작은것을 할당
        
        if result == abs(value) { // result가 바뀌었다면
            unique = [start, end] // 인덱스 저장해둔다.
        }
         
        if value < 0 { // value가 0 보다 작다면
            start += 1
        } else { // value가 0보다 크다면
            end -= 1
        }
    }
    unique = [solutions[unique[0]], solutions[unique[1]]]
    return unique.map{ String($0) }.joined(separator: " ")
}
print(solution(readLine()!))
