import Foundation

let n = Int(readLine()!)!
var time = [(Int, Int)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    time.append((input[0], 1))
    time.append((input[1], -1))
}

var answer = 0
var room = 0
time.sort(by: <)

for (_, meeting) in time {
    room += meeting
    if meeting == 1 {
        answer = max(room, answer)
    }
}

print(answer)
