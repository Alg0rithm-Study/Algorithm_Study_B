import Foundation

func solution(_ new_id:String) -> String {
    var newID = ""
    
    //대문자를 소문자로 치환
    var lowercase = new_id.lowercased()
    
    // 알파벳, 숫자, 빼기, 밑줄, 마침표 제외 모두 제거
    for c in lowercase {
        if c.isLowercase || c.isNumber || c == "-" || c == "_" || c == "." {
            newID += c.description
        }
    }
    
    // 마침표 2번 연속된 부분을 하나의 마침표로 치환
    while newID.contains("..") {
        newID = newID.replacingOccurrences(of: "..", with: ".")
    }
    
    // 마침표가 처음이나 끝에 위치한다면 제거
    newID = newID.trimmingCharacters(in: ["."])
    
    // 빈문자열이라면 "a"를 대입한다
    if newID.count == 0 {
        newID += "a"
    }
    
    // 16자 이상이라면 15개 문자 제외한 나머지 삭제
    if newID.count > 15 {
        newID = newID.prefix(15).description
        if newID.last == "." {
            newID = newID.dropLast().description
        }
    }
    
    // new_id 길이가 2자 이하라면 마지막 문자를 3이 될때까지 추가
  
    if newID.count <= 2 {
        while newID.count < 3 {
            newID += newID.last!.description
        }
    }
    
    return newID
}
