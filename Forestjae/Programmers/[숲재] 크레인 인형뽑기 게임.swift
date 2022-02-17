import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var basket: [Int] = []
    var newBoard: [[Int]] = []
    var bomb: Int = 0
    newBoard.append(contentsOf: repeatElement([], count: board.count))

    for i in 0..<board.count {
        for j in 0..<board[0].count {
            newBoard[j].append(board[i][j])
        }
    }

    func bombBasket(_ newToy: Int) {
        guard basket.count > 1 else {
            return
        }
        if newToy == basket[basket.count - 2] {
            print(basket.popLast())
            print(basket.popLast())
            bomb += 2
        }
    }

    for move in moves {
        var depth: Int = 0
        while depth < board.count {
            let target: Int = newBoard[move-1][depth]
            if target != 0 {
                basket.append(target)
                newBoard[move-1][depth] = 0
                bombBasket(target)
                break
            } else {
                depth += 1
            }
        }
    }

    return bomb
}
