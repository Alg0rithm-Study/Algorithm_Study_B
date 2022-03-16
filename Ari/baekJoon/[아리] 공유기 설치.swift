// 입력
let input = readLine()!.split(separator: " ").compactMap { Int($0.description) }
var houses = [Int]()
for _ in 0..<input[0] {
    houses.append(Int(readLine()!)!)
}
houses.sort(by: <)

// 풀이
func solution(input: [Int], houses: [Int]) -> Int {
    let target = input[1]
    
    var min = 1 // 공유기 사이의 거리가 가장 짧은 경우 (옆집에 설치했을 경우)
    var max = houses.last! - houses.first! // 공유기 사이의 거리가 가장 긴 경우 (가장 멀리떨어진 두 집 사이의 거리)
    var mid = 0
    var result = 0
  
    while min <= max {
        mid = (min + max) / 2
        
        var installedCount = 1 // 공유기 설치한 횟수
        var prev = 0 // 이전 집 위치
        
        for i in 1..<houses.count where houses[i] - houses[prev] >= mid { // 이전집과 현재집 사이의 거리가 mid 이상인지 체크
            installedCount += 1 // mid 이상이면 설치!
            prev = i // 이전 집 갱신!
        }
        
        if installedCount >= target { // 공유기 설치된 갯수가 주어진 공유기 이하인지 체크
            result = mid
            min = mid + 1
        } else {
            max = mid - 1
        }
    }
    
    return result
}

print(solution(input: input, houses: houses))
