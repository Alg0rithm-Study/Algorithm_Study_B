import Foundation

func solution(_ dartResult:String) -> Int {
    
    let scores = dartResult.split(whereSeparator: { $0.isLetter || ["*", "#"].contains($0) }).compactMap{ Int($0) }
    let bonusAndOption = dartResult.split(whereSeparator: { $0.isNumber })
    
    var result = scores.compactMap{ Int($0) }

    for (index, (score, element)) in zip(scores, bonusAndOption).enumerated() {
        var number = 0
        number = element.contains("T") ? score * score * score : element.contains("D") ? score * score : score
        number *= element.contains("*") ? 2 : element.contains("#") ? -1 : 1
        number *= index >= 2 ? 1 : bonusAndOption[index + 1].contains("*") ? 2 : 1
        result[index] = number
    }
    return result.reduce(0, +)
}
