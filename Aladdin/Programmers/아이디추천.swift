import Foundation

func solution(_ new_id:String) -> String {
    var newID = new_id
    //1 단계
    newID = newID.lowercased()
    // 2 단계
    newID = newID
        .filter { $0.isLetter || $0.isNumber || ["-","_","."].contains( String($0) )}
        .map{ String($0) }
        .joined()
    // 3단계
    while newID.contains("..") {
        newID = newID.replacingOccurrences(of: "..", with: ".")
    }
    // 4단계
    newID = newID.trimmingCharacters(in: ["."])

    // 5단계
    newID = newID.isEmpty ? "a" : newID

    // 6단계
    while newID.contains(" ") {
        newID = newID.replacingOccurrences(of: " ", with: "")
    }

    if newID.count >= 16 {
        newID = String(newID.prefix(15))
    }

    if newID.hasSuffix(".") {
        newID.removeLast()
    }
    
    // 7단계
    while newID.count <= 2 {
        newID.append(newID.last!)
    }

    return newID
}

