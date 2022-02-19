// Logic
// 1. 겹치는 구간 찾기
// 2. 시작은 1, 종료는 -1
// 3. 시작과 종료가 겹칠 때는 종료가 먼저 오도록 세팅
// 4. 합을 순서대로 누적하며 최대값을 리턴

// Solution
import Foundation

let size = Int(readLine()!)!
var conferenceTime = [(Int, Int)]()

for _ in 0..<size {
    let time = readLine()!.split(separator: " ").map { Int(String($0))! }
    conferenceTime.append((time[0], 1))
    conferenceTime.append((time[1], -1))
}

var timeline = conferenceTime.sorted { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }.map { $0.1 }

for i in 0..<timeline.count - 1 {
    timeline[i+1] += timeline[i]
}

print(timeline.max()!)
