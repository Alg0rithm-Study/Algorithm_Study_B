// 그냥 시키는 그대로 구현
// 1. 주어진 move 하나씩을 column 으로 생각하고 row 는 0부터 board.count 까지
    // 해서 board에서 인형 하나씩 접근
// 2. stack의 마지막 원소랑 비교해서 answer/stack 에 적절한 변화 수행
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var answer = 0
    var board = board
    var stack: [Int] = []
    
    for move in moves {
        let col = move - 1
        for row in 0..<board.count {
            let number = board[row][col]
            guard number != 0 else {
                continue
            }
            board[row][col] = 0
            if stack.last == number {
                stack.removeLast()
                answer += 2
            } else {
                stack.append(number)
            }
            break
        }
    }
    return answer
}
