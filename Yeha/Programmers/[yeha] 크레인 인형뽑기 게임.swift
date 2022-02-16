// 1. board의 (moves의 숫자)행에 0이 아닌 수가 나올 때까지 for문을 돈다
// 2. 0이 아닌 수가 나왔다면 바구니 맨 마지막 수가 해당 수와 같은지 비교한다
// 3. 같다면 바구니 마지막 수를 없엔 후 사라짐 카운팅을 2 올려준다 (비교하는 수, 바구니 맨 마지막 수 2개가 사라짐)
// 4. 같지 않다면 바구니에 넣는다
// 5. board 해당 자리를 0으로 바꾼다

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var popCounting = 0
    var basket = Array<Int>()

    moves.forEach { num in
        for i in 0..<board.count {
            let target = board[i][num - 1]
            if target != 0 {
                if basket.last == target {
                    basket.removeLast()
                    popCounting += 2
                } else {
                    basket.append(target)
                }
                board[i][num - 1] = 0
                return
            }
        }
    }
    return popCounting
}
