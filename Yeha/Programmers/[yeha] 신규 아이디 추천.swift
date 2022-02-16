func solution(_ new_id:String) -> String {
    var answer = new_id

    answer = answer.lowercased()

    answer = answer.filter { $0.isLetter || $0.isNumber || ["-","_","."].contains($0) }

    while answer.contains("..") {
        answer = answer.replacingOccurrences(of: "..", with: ".")
    }

    answer = answer.trimmingCharacters(in: ["."])

    if answer.isEmpty {
        answer.append("a")
    }

    while answer.contains(" ") {
        answer = answer.replacingOccurrences(of: " ", with: "")
    }

    while answer.count >= 16 {
        answer = String(answer.prefix(15))
    }

    if answer.hasSuffix(".") {
        answer.removeLast()
    }

    while answer.count < 3 {
        answer.append(answer.last!)
    }

    return answer
}
