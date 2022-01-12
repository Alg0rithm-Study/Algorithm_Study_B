import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    enum Hand {
        case left
        case right
    }
    
    // 초기 세팅
    var result = ""
    var leftHand = 10 
    var rightHand = 12
    
    for i in numbers {
        let number = i == 0 ? 11 : i
        var tabHand: Hand = .left
        
        switch number {
        case 1, 4, 7:
            tabHand = .left
        case 3, 6, 9:
            tabHand = .right
        case 2, 5, 8, 11:
            // 왼손, 오른손 눌렀던 숫자의 차이 절대값 구하기
            let leftTemp = abs(number - leftHand)
            let rightTemp = abs(number - rightHand)
            // 숫자의 차이를 3으로 나누고, 몫을 더하면 거리를 계산할 수 있다.
            let leftDistance = (leftTemp / 3) + (leftTemp % 3)
            let rightDistance = (rightTemp / 3) + (rightTemp % 3)

            if leftDistance == rightDistance { // 거리가 같은 경우
                tabHand = hand == "left" ? .left : .right // 손잡이에 따라 결정
            } else { // 거리가 다르다면 짧은 손으로 결정
                tabHand = leftDistance < rightDistance ? .left : .right
            }
        default: 
            break
        }
        
        if tabHand == .left {
            result += "L"
            leftHand = number
        } else {
            result += "R"
            rightHand = number
        } 
        
    }
    
    return result
}
