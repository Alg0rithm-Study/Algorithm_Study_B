// Logic
// 1. 대문자 -> 소문자
// 2. 알파벳 소문자, 숫자, -, _, . 제외 특수문자 제거
// 3. 마침표 두 개 연속인 것 하나로
// 4. 처음/끔 마침표 제거
// 5. 빈문자열 -> a 추가
// 6. 길이 16이상 -> 첫 15개 자르기 -> 끝 마침표 있다면 제거
// 7. 길이 2 이하 -> 마지막 문자를 길이가 3이 될때까지 반복

// Solution
import Foundation

func solution(_ new_id:String) -> String {
    var newId = new_id
    
    newId = newId.lowercased()
    
    newId = newId.filter { $0.isNumber || $0.isLetter || ["-","_","."].contains($0) }
    
    while newId.contains("..") {
        newId = newId.replacingOccurrences(of: "..", with: ".")    
    }
    
    newId = newId.trimmingCharacters(in: ["."])
    
    newId = newId.isEmpty ? "a" : newId
    
    newId = newId.count > 15 ? String(newId.prefix(15)) : newId
    newId = newId.trimmingCharacters(in: ["."])
    
    while newId.count < 3 {
        newId.append(newId.last!)
    }
    
    return newId
}
