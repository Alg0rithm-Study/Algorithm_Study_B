import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    var handString: String
    if hand == "left" {
        handString = "L"
    } else {
        handString = "R"
    }
    var currentRight = 11
    var currentLeft = 10
    let keypad = [[1,2,3],[4,5,6],[7,8,9],[10,0,11]]
    var dic: [Int: (Int, Int)] = [:]
    for row in 0..<keypad.count {
        for column in 0..<keypad[0].count {
            dic[keypad[row][column]] = (row, column)
        }
    }
    for number in numbers {
        switch number {
        case 1, 4, 7:
            result += "L"
            currentLeft = number
        case 3, 6, 9:
            result += "R"
            currentRight = number
        case 2, 5, 8, 0:
            let rightPosition = dic[currentRight]!
            let leftPosition = dic[currentLeft]!
            let targetPosition = dic[number]!

            let leftDistance = distance(leftPosition, targetPosition)
            let rightDistance = distance(rightPosition, targetPosition)

            if leftDistance > rightDistance {
                result += "R"
                currentRight = number
            } else if leftDistance < rightDistance {
                result += "L"
                currentLeft = number
            } else {
                result += handString
                if handString == "R" {
                    currentRight = number
                } else {
                    currentLeft = number
                }
            }
        default :
            continue
        }
    }
    return result
}

func distance(_ handPosition: (Int, Int), _ targetPosition: (Int, Int)) -> Int {
    let x = handPosition.0 - targetPosition.0
    let y = handPosition.1 - targetPosition.1

    return abs(x) + abs(y)
}
