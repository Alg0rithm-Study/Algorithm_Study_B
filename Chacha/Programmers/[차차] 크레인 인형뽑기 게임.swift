// Logic
// 1. 스택을 활용
// 2. moves를 돌며 뽑을 위치로 이동
// 3. 아이템을 뽑는데, 기존의 stack의 마지막 요소와 지금 뽑는게 같을 경우 2개를 추가해주고 stack에서 pop
// 4. 같지 않을 경우 stack에 append
// 5, 반복

// Solution
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var result = 0
    var board = board
    var stack = [Int]()
    
    moves.forEach { move in
        for i in 0..<board.count {            
            let item = board[i][move-1]            
            board[i][move-1] = 0
            
            if item != 0 {
                if stack.last == item {
                    stack.removeLast()
                    result += 2
                    return
                }
                stack.append(item)
                return
            }
        }
    }
    
    return result
    
}
