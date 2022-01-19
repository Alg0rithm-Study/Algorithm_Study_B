// Logic 
// 1. 점수와 보너스/옵션 분리
// 2. 보너스에 맞게 점수 추가
// 3. 옵션에 맞게 점수 추가
// 4, "*"의 경우 다음번에 있을 경우 현재 점수에 두 배 반영

// Solution
func solution(_ dartResult:String) -> Int {
    var totalScore = 0
    let scores = dartResult.split(whereSeparator: { $0.isLetter || ["*","#"].contains($0) })
    let bonusAndOption = dartResult.split(whereSeparator: { $0.isNumber })
        
    for (i, (score, bao)) in zip(scores, bonusAndOption).enumerated() {
        var point = 0
        let score = Int(score)!
        
        point = bao.contains("D") ? pow(score, 2) : bao.contains("T") ? pow(score, 3) : score
        point *= bao.last == "*" ? 2 : bao.last == "#" ? -1 : 1        
        point *= i >= 2 ? 1 : bonusAndOption[i+1].last == "*" ? 2 : 1
    
        totalScore += point
    }
        
    return totalScore
}

func pow(_ number: Int, _ n: Int) -> Int {    
    var result = number
    for _ in 1..<n {
        result *= number
    }
    
    return result
}
