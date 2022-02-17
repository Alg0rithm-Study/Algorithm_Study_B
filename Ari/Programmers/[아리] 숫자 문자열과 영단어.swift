import Foundation

func solution(_ s:String) -> Int {
    let arr = ["zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
    var result = s

    for (key, value) in arr {
        if result.contains(key) {
            result = result.replacingOccurrences(of: key, with: value)
        }
    }

    return Int(result) ?? 0
}
