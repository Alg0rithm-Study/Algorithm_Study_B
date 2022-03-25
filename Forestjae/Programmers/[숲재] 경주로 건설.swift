import Foundation

func solution(_ board:[[Int]]) -> Int {
    let move = [(0,1), (0,-1), (1,0), (-1,0)]
    //var points = [,]
    print(board)
    var board = board.map { $0.map { $0 == 0 ? 1 : 0}}.map { $0.map { ($0, Int[]()) } }
    board[0][0] = (0, 0)
    var points = [(Int,Int,Int,Int)]()
    
    if board[0][1].0 != 0 {
        points.append((0,1,100,1))
        board[0][1] = (2, [100])
    }
    if board[1][0].0 != 0 {
        points.append((1,0,100,0))
        board[1][0] = (2, [100])
    } 

    var result = 0
    while !points.isEmpty {
    
        let new = points.removeFirst()
        let x = new.0
        let y = new.1
        let cost = new.2
        let direction = new.3
        move.forEach { (dx, dy) in
            let nx = x + dx 
            let ny = y + dy
            if nx < 0 || ny < 0 || nx >= board.count || ny >= board.count { return }
            if board[nx][ny].0 == 0 { return }
            if board[nx][ny].0 != 0 {
                // 방향이 같을때 
                let newDirection = dx == 0 ? 1 : 0 // dx가 0 이면 세로방향 이동이므로 1로 표시
                if direction == newDirection  {
                    if board[nx][ny].0 == 1 { 
                        points.append((nx, ny, 100, newDirection))   
                        board[nx][ny] = (board[x][y].0 + 1 , [board[x][y].1 + 100])
                    } else {
                        if board[nx][ny].1 >= board[x][y].1 + 100 {
                            points.append((nx, ny, 100, newDirection)) 
                            board[nx][ny] = (board[x][y].0 + 1 , board[x][y].1 + 100)
                        }
                    }
                } else {
                    if board[nx][ny].0 == 1 {
                    points.append((nx, ny, 600, newDirection))
                    board[nx][ny] = (board[x][y].0 + 1 , board[x][y].1 + 600)
                    } else if board[nx][ny].1 >= board[x][y].1 + 600 {
                        points.append((nx, ny, 600, newDirection))    
                        board[nx][ny] = (board[x][y].0 + 1 , board[x][y].1 + 600)
                    }
                }
            }     
        }
    }    
    
    print(board)
    // return board[board.count-1][board.count-1].1
    return 0
}