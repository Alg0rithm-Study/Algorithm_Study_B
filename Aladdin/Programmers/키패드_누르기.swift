// 1. 손가락, 좌표 를 dictionary 로 매핑 해놓고
// 2. 주어진 numbers 순서대로 접근해서 좌표간의 거리 계산해서, 다음 손가락이 어디로 갈지 저장
import Foundation

struct HandPosition {
    enum Hand {
        case right
        case left
        case neutral
    }
    let hand: Hand
    let x: Int
    let y: Int
}

func getDistance(of handPosition: HandPosition, and otherHandPosition: HandPosition) -> Int {
    return abs(handPosition.x - otherHandPosition.x) + abs(handPosition.y - otherHandPosition.y)
}

func calculateAndNavigate(
    currentLeft: inout HandPosition,
    currentRight: inout HandPosition,
    handPosition: HandPosition,
    hand: String,
    answer: inout String
) {
    let leftDistance = getDistance(of: currentLeft, and: handPosition)
    let rightDistance = getDistance(of: currentRight, and: handPosition)
    
    if leftDistance == rightDistance {
        if hand == "right" {
            answer += "R"
            currentRight = handPosition
        } else {
            answer += "L"
            currentLeft = handPosition
        }
    } else if leftDistance < rightDistance {
        answer += "L"
        currentLeft = handPosition
    } else {
        answer += "R"
        currentRight = handPosition
    }
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    let coordinates: [Int: HandPosition] = [1: HandPosition(hand: .left, x: 0, y: 0),
                                            2: HandPosition(hand: .neutral, x: 0, y: 1),
                                            3: HandPosition(hand: .right, x: 0, y: 2),
                                            4: HandPosition(hand: .left, x: 1, y: 0),
                                            5: HandPosition(hand: .neutral, x: 1, y: 1),
                                            6: HandPosition(hand: .right, x: 1, y: 2),
                                            7: HandPosition(hand: .left, x: 2, y: 0),
                                            8: HandPosition(hand: .neutral, x: 2, y: 1),
                                            9: HandPosition(hand: .right, x: 2, y: 2),
                                            0: HandPosition(hand: .neutral, x: 3, y: 1)]
    var currentLeft = HandPosition(hand: .left, x: 3, y: 0)
    var currentRight = HandPosition(hand: .right, x: 3, y: 2)
    
    for number in numbers {
        guard let handPosition = coordinates[number] else {
            continue
        }
        
        switch handPosition.hand {
        case .right:
            answer += "R"
            currentRight = handPosition
        case .left:
            answer += "L"
            currentLeft = handPosition
        case .neutral:
            calculateAndNavigate(currentLeft: &currentLeft, currentRight: &currentRight, handPosition: handPosition, hand: hand, answer: &answer)
        }
    }
    
    return answer
}

