import Foundation

func solution(_ new_id:String) -> String {

    let upper = new_id.lowercased()
    var refined = upper.filter {
        ("a"..."z").contains($0) || ["-", "_", "."].contains($0) || $0.isNumber
    }

    while refined.contains("..") {
        refined = refined.replacingOccurrences(of: "..", with: ".")
    }

    var trimmingPunctuation = refined.trimmingCharacters(
        in: Set("."))

    if trimmingPunctuation.count == 0 {
        trimmingPunctuation = "a"
    } else if trimmingPunctuation.count > 15 {
        trimmingPunctuation = String(trimmingPunctuation.prefix(15))
        if trimmingPunctuation.last! == "."{
        trimmingPunctuation = String(trimmingPunctuation.prefix(trimmingPunctuation.count - 1))
        }
    }
    if trimmingPunctuation.count <= 2 {
        let char = trimmingPunctuation.last!

        while trimmingPunctuation.count <= 2 {
            trimmingPunctuation += String(char)
        }
    }
    return trimmingPunctuation
}
