import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var result = 0
    var board = board
    var basket = [Int]()
    
    
    for i in moves {
        let move = i - 1
        for crain in 0..<board.count {
            let item = board[crain][move] // 뽑은 숫자 담기
            
            guard item != 0 else { // 뽑은 아이템이 없다면 다음 반복시작 (빈칸 == 0)
                continue    
            }
            
            board[crain][move] = 0 // 뽑고나면 0으로 빈칸으로 바꾸기
            
            if basket.last == item { // 바구니의 끝과 같다면 카운트하고 삭제.
                basket.removeLast()
                result += 2
            } else { // 같지않다면 쌓기
                basket.append(item)
            }
            break
        }
    }
    
    return result
}
