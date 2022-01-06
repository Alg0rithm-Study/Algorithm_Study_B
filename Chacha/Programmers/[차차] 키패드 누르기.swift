// Logic 
// 1. digits[2]에 속하면 오른손, digits[0]에 속하면 왼손, 나머지는 거리에 따라
// 2. 거리가 같을 경우 손잡이에 따라 선택 이동

// Solution
import Foundation

typealias location = (x: Int, y: Int)

func solution(_ numbers:[Int], _ hand:String) -> String {    
    let digits = [[1,4,7], [2,5,8,0], [3,6,9]]
    var result = ""
    var numberPad = [Int:location]()
    var leftHand = (0,3), rightHand = (2,3)
    
    for (i, digit) in digits.enumerated() {
        for (j, num) in digit.enumerated() {
            numberPad[num] = (i,j)
        }
    }
    
    numbers.forEach { number in
        let numberPosition = numberPad[number]!
                     
        if digits[2].contains(number) {
            result += "R"
            rightHand = numberPosition
        } else if digits[0].contains(number) {
            result += "L"
            leftHand = numberPosition
        } else {
            let leftHandDistance = getDistance(leftHand, numberPosition)
            let rightHandDistance = getDistance(rightHand, numberPosition)
            
            if leftHandDistance > rightHandDistance {
                result += "R"
                rightHand = numberPosition
            } else if leftHandDistance < rightHandDistance {
                result += "L"
                leftHand = numberPosition
            } else {
                if hand == "left" {
                    result += "L"
                    leftHand = numberPosition
                } else {
                    result += "R"
                    rightHand = numberPosition
                }                
            }
        }
    }
    
    return result
}

func getDistance(_ hand: location, _ digit: location) -> Int {
    return abs(hand.x - digit.x) + abs(hand.y - digit.y)
}
