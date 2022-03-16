/*
 명령어    수신 탑(높이)
 I 숫자    큐에 주어진 숫자를 삽입합니다.
 D 1    큐에서 최댓값을 삭제합니다.
 D -1    큐에서 최솟값을 삭제합니다.

주어진 명령어에 따라 append, remove를 한다.
1. 큐를 삽입하는 경우 append 후 continue한다.
2. 큐를 삭제하는 경우 큐에 요소가 있는지 먼저 검사한다. 이후 queue를 정렬하여 최댓값 혹은 최소값을 remove해준다.
*/

func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    for operation in operations {
        if operation.contains("I") {
            let number = operation.split(separator: " ").compactMap { Int($0) } // 자른 후 Int 변환 옵셔널바인딩
            queue.append(contentsOf: number) // 반환값이 배열이라 contentsOf로 append
            continue // append 후 continue
        }
        guard queue.isEmpty == false else { continue } // 큐가 비어있는지 검사
        queue.sort { $0 < $1 } // 최솟값, 최댓값 구별을 위한 정렬
        if operation == "D 1" {
            queue.removeLast()
        } else {
            queue.removeFirst()
        }
    }
    return [queue.max() ?? 0, queue.min() ?? 0]
}
