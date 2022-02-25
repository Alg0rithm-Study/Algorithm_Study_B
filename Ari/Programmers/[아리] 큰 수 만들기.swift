/*
 String 인덱스 다루기 까다로워서 Int 배열로 변환
 숫자를 반복하면서 큰 수를 차곡차곡 result에 쌓기
 이 때 result의 마지막 수보다 반복하고있는 현재 숫자가 클 경우 지우고, 제거횟수도 차감해주기.
 예외케이스로 count가 0이 아닐경우 남은 잔여 count만큼 마지막을 잘라주기
 */
import Foundation

func solution(_ number: String, _ k: Int) -> String {
    var count = k // number를 제거할 count
    let totalNumbers = number.compactMap { $0.wholeNumberValue } // String to [Int]
    var result = [Int]()

    for current in totalNumbers {
        // result가 비어있지 않고,count가 0보다 크고, currnt가 result.last 보다 클 때,
        while !result.isEmpty && count > 0 && result.last! < current {
            result.removeLast() // result의 마지막을 remove
            count -= 1 // count를 차감
        }
        result.append(current)
    }
    if count > 0 { // 만약 반복문을 다 돌고도 카운트가 남아있다면 끝을 잘라내주기
        result = Array(result[0..<result.count-count])
    }

    return result.reduce("") { $0 + String($1) }
}
