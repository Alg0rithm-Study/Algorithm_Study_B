// Logic
// 1, 명령어 문자열 분리 
// 2. 명령어에 따른 로직 분리
// 3. 큐가 비어있는지 확인하고 제거 진행
// 4. 큐에서 최대,최소값 확인 후 반환

// Solution
import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    
    for operation in operations {
        let splittedOperation = operation.components(separatedBy: " ") 
        let command = splittedOperation[0], option = Int(splittedOperation[1])!

        if command == "I" {
            queue.append(option)
        } else {
            guard !queue.isEmpty else {
                continue 
            }
            
            if option == 1 {
                if let maxValue = queue.max(), let idx = queue.firstIndex(of: maxValue) {
                    queue.remove(at: idx)
                }                
            } else {
                if let minValue = queue.min(), let idx = queue.firstIndex(of: minValue) {
                    queue.remove(at: idx)
                }
            }
        }
    }
    
    return [queue.max() ?? 0, queue.min() ?? 0]
}

// Solution 2 - 정렬 풀이 
func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    var operations = operations.map {$0.components(separatedBy: " ")}

    for operation in operations {
        let oper = operation[0]
        let num = Int(operation[1])!

        switch oper {
        case "I":
            queue.append(num)
        case "D":
            queue.sort {$0 < $1}
            if !queue.isEmpty {
                if num == 1 {
                    queue.removeLast()
                } else {
                    queue.removeFirst()
                }
            }            
        default:
            break
        }
    }

    return queue == [] ? [0,0] : [queue.max()!, queue.min()!]
}
