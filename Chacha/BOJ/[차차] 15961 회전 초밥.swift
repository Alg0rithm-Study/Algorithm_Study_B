// Logic
// 1. 중복되지 않게 연속 K개 먹기
// 2. 쿠폰 번호가 포함되지 않도록 1번에서 먹어줘야 많이 먹을 수 있다
// 3. 한 바퀴 도는 걸 고려해서 배열을 k개 만큼 붙이기
// 4. 초밥의 종류만큼의 크기를 가지는 배열 생성, 먹으면 +1,
// 5. (lhs,rhs)로 윈도우 크기 정하고, rhs에서 매 새로운 초밥을 먹는다.
//    - 새로 먹은 초밥의 배열 값이 1이면 새로 먹은거니까 count + 1
//    - 윈도우 크기를 넘을 경우 좌측 초밥 제거, 제거 후 0개면 count - 1
//    - lhs + 1하여 윈도우 이동
// 6. 쿠폰 초밥을 먹지 않은 경우 + 1한 값과 최댓값 비교

// Solution
import Foundation

// 라이노님의 빠른입력
class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always)  private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always)  func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { // 공백과 줄바꿈 무시
            now = read()
        }

        if now == 45{ // 음수 처리
            isPositive.toggle()
            now = read()
        }

        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always)  func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}

let file = FileIO()
let input = [file.readInt(), file.readInt(), file.readInt(), file.readInt()]
let plateNumber = input[0], species = input[1], k = input[2], coupon = input[3]
var lhs = 0
var selectedSushi = Array(repeating: 0, count: species)
var sushi = [Int]()
var count = 0
var answer = 0

for _ in 0..<plateNumber {
    sushi.append(file.readInt())
}

sushi.append(contentsOf: sushi[0..<k])

for rhs in 0..<plateNumber+k {
    selectedSushi[sushi[rhs]-1] += 1 // 새 초밥 추가
    count += selectedSushi[sushi[rhs]-1] == 1 ? 1 : 0 // 새 초밥이 1개면 count도 추가
    
    // 연속된 초밥 개수 초과하지 않도록 확인
    if rhs - lhs + 1 > k {
        selectedSushi[sushi[lhs]-1] -= 1 // 넘은 경우 가장 왼쪽 초밥 제거
        count -= selectedSushi[sushi[lhs]-1] == 0 ? 1 : 0 // 제거 이후 0개면 count에서도 제거
        lhs += 1 // window 이동
    }
    
    // 쿠폰 초밥을 먹지 않았다면 count+1하여 최대값 비교
    answer = selectedSushi[coupon-1] == 0 ? max(answer, count+1) : max(answer, count)
}

print(answer)
