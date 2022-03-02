import Foundation

func solution(_ dartResult:String) -> Int {
    var result: [Int] = []
    var games: [String] = []
    var temp: String = ""
    let dict: [Character: Int] = ["S": 1, "D": 2, "T": 3, "*": 2, "#": -1]

    dartResult.forEach {
        if let number = Int(String($0)), temp.count > 1 {
            games.append(temp)
            temp = ""
            temp += String($0)
            return
        }
        temp += String($0)
    }
    games.append(temp)

    for (idx, game) in games.enumerated() {
        var temp = ""
        var tempNum = 0
        for i in game {
            if i.isNumber {
                temp += String(i)
            } else if tempNum == 0 {
                tempNum = Int(temp)!
            }
            if ["S", "D", "T"].contains(i) {
                tempNum = Int(pow(Double(tempNum), Double(dict[i]!)))
            } else if ["*", "#"].contains(i) {
                tempNum = tempNum * dict[i]!
                if String(i) == "*" && idx > 0 {
                    result[idx - 1] = result[idx - 1] * dict[i]!
                }
            }
        }
        result.append(tempNum)
    }

    return result.reduce(0, { $0 + $1 })
}
