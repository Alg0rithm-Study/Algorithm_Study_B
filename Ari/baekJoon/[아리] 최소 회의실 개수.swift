let count = Int(readLine()!)!
var arr = [(Int, Int)]()
for _ in 0..<count { // 튜플 형태로 회의실의 시작시간, 종료시간을 append
    let element = readLine()!.split(separator: " ").compactMap { Int($0) }
    let start = (element[0], 1)
    let end = (element[1], -1)
    arr.append(start)
    arr.append(end)
}

func solution(_ times: [(Int, Int)]) -> Int {
    var result = 0
    var current = 0
    for time in times {
        current += time.1 // 현재 사용하고있는 회의실의 개수를 더한다.
        result = max(current, result) // 동시에 회의실을 몇개 사용하는지 구하기
    }
    return result
}
print(solution(arr.sorted(by: <))) // 입력받아온 배열을 오름차순으로 정렬 
