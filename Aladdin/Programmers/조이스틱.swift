import Foundation

func convertToValue(from letter: String.Element) -> Int {
    let value = letter.asciiValue!

    if value > 78 {
        return Int(90 - value + 1)
    } else {
        return Int(value - 65)
    }
}

func solution(_ name:String) -> Int {
    let name = name.map { $0 }
    let length = name.count
    var sumUpDown = 0 // 위 아래 조작 합
    var minLeftRight = name.count // 좌 우 조작 합

    for (index, letter) in name.enumerated() {
        sumUpDown += convertToValue(from: letter) // 위 아래 조작 값 환산

        var nextLetterIndex = index + 1

        while nextLetterIndex < length && name[nextLetterIndex] == "A" { // 다음 문자에 A 가 몇개 연속되는지 확인
            nextLetterIndex += 1
        }
        // 연속된 A의 앞쪽이랑 뒷쪽 중 짧은 쪽을 선택
        minLeftRight = min(minLeftRight, 2 * index + length - nextLetterIndex, (length - nextLetterIndex) * 2 + index)
    }
    return sumUpDown + minLeftRight
}

