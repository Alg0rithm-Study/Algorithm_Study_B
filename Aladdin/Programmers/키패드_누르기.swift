
import Foundation

typealias Position = [Int, Int]

func getDistance(of )

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var answer = ""
    let grid = [[1, 2, 3],
            [4, 5, 6],
            [7, 8, 9],
            ['*', 0, '#']]
    // coordination map
    // [ Hand data, [x,y] ]
    let coordinates = {1: ['L', Position(0, 0)],
              2: ['N', [0,1]],
              3: ['R', [0,2]],
              4: ['L', [1,0]],
              5: ['N', [1,1]],
              6: ['R', [1,2]],
              7: ['L', [2,0]],
              8: ['N', [2,1]],
              9: ['R', [2,2]],
              0: ['N', [3,1]] }
    let left = [3, 0]
    let right = [3, 2]
    
    for number in numbers {
        let (hand, position) = coordinates[number]
        switch hand {
        case "R":
            answer += "R"
            right = position
        case "L":
            answer += "L"
            left = position
        case "N":
            let leftDistance = abs(
        }
    }
    
}
