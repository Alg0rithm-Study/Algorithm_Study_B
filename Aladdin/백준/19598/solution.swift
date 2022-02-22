import Foundation

// 회의 시작 시간, 끝나는 시간을 분리해서 1/-1 로 표시
// 분리한 데이터 전체를 정렬해서
// 전부 더하면서 최댓값 업데이트


let N  = Int(readLine()!)!
var data: [(Int, Int)] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    
    data.append((input[0], 1))
    data.append((input[1], -1))
}

data.sort(by: <)


var sum = 0, answer = 0

for (_, type) in data {
    sum += type
    answer = max(answer, sum)
}

print(answer)




