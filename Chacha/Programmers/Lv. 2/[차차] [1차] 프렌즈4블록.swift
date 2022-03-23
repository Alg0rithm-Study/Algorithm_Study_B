/* Logic 
1. findBlock으로 지울 블록 찾기
2. removeBlock으로 블록 지우기
  2-1. 지우고 난 뒤 moveBlock으로 블록 이동
  2-2. 이동시킬 때 transpose 사용하여 전치 행렬로 만들고 다시 원복
3. 위 과정 반복하며 지워진 블록 개수 누적 
*/

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var board = board.map { Array($0) }
    
    while true {
        let targetBlocks = findBlock(board)
        if targetBlocks.isEmpty {
            break
        }
        removeBlock(&board, targetBlocks)    
    }
    
    return board.map { $0.filter { $0 == "-"}.count }.reduce(0,+)
}

func transpose(_ board: inout [[Character]]) {
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if i > j {
                let temp = board[i][j]
                board[i][j] = board[j][i]
                board[j][i] = temp
            }            
        }
    }
}

func moveBlock(_ board: inout [[Character]]) {    
    transpose(&board)    
    
    let removedCounts = board.map { $0.filter { $0 == "-" }.count }
    board = board.map { $0.filter { $0 != "-" }}
    
    for i in 0..<removedCounts.count {
        for _ in 0..<removedCounts[i] {
            board[i].insert("-", at: 0)
        }    
    }
    
    transpose(&board)  
}

func removeBlock(_ board: inout [[Character]], _ indices: [[Int]]) {    
    indices.forEach {
        board[$0[0]][$0[1]] = "-"
    }
    
    moveBlock(&board)
}

func findBlock(_ board: [[Character]]) -> [[Int]] {
    var targetBlock = Set<[Int]>()
    
    for i in 0..<board.count-1 {
        for j in 0..<board[0].count-1 {
            if board[i][j] == "-" {
                continue
            }
            var flag = true
            let target = board[i][j]
            let indices = [[i, j], [i+1, j], [i, j+1], [i+1, j+1]]
            for idx in 0..<indices.count-1 {
                let now = indices[idx], next = indices[idx+1]
                if board[now[0]][now[1]] != board[next[0]][next[1]] {
                    flag = false
                    break
                }
            }
            
            if flag {
                indices.forEach {
                    targetBlock.insert([$0[0], $0[1]])
                }
            }            
        }
    }
    
    return Array(targetBlock)
}
