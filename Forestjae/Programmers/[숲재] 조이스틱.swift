import Foundation

func solution(_ name:String) -> Int {
    let datumPoint = (65, 90)
    let charArray = name.compactMap { $0.asciiValue }.map { Int($0) }
        
    var verticalMove = 0
  
    
    for char in charArray {
        verticalMove += min(char - datumPoint.0, datumPoint.1 - char + 1)
    }
    
    let movePoint = charArray.map { $0 - 65 }
    var horiMove = movePoint.count - 1
    for (idx, number) in movePoint.enumerated() {
        if movePoint[idx] == 0 {
            var nextZeroDistance = idx
            var leftMove = 0
            var rightMove = 0
            while nextZeroDistance < movePoint.count && movePoint[nextZeroDistance] == 0 {
                nextZeroDistance += 1
            }
           
            rightMove = idx == 0 ? idx  : idx - 1
            
            leftMove = movePoint.count - nextZeroDistance
            let tempMove = leftMove + rightMove + min(leftMove, rightMove)
            horiMove = min(tempMove, horiMove)
        }
    }
    
    return verticalMove + horiMove
}

//

import Foundation

func solution(_ name:String) -> Int {
    let datumPoint = (65, 90)
    let charArray = name.compactMap { $0.asciiValue }.map { Int($0) }
        
    var verticalMove = 0
  
    
    for char in charArray {
        verticalMove += min(char - datumPoint.0, datumPoint.1 - char + 1)
    }
    
    var horiMove = 0
    var currentIndex = 0
    var movePoint = charArray.map { $0 - 65 }
    movePoint[0] = 0

    while movePoint.filter { $0 == 0 }.count != charArray.count {
        let right = movePoint.firstIndex(where: { $0 != 0 })!
        let left = movePoint.lastIndex(where: { $0 != 0 })!
        let rightDistance = right - currentIndex > 0 ? (right - currentIndex) : (right - currentIndex + charArray.count)
        let leftDistance = currentIndex - left > 0 ? (currentIndex - left) : (currentIndex - left + charArray.count)
        print("currentIndex: \(currentIndex)")
        print("rightDistance: \(rightDistance), leftDistance: \(leftDistance)")
        
        if rightDistance > leftDistance {
            horiMove += leftDistance
            leftTotal += leftDistance
            currentIndex = left    
            movePoint[currentIndex] = 0
        } else if rightDistance < leftDistance {
            horiMove += rightDistance
            rightTotal += rightDistance
            currentIndex = right
            movePoint[currentIndex] = 0
        }       
    }

    return verticalMove + horiMove
}