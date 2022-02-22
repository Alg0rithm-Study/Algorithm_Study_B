func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    
    for word in operations {
        let cmd = word.split(separator: " ").map { (String($0)) }
        
        if cmd[0] == "I" {
            queue.append(Int(cmd[1])!)
        } else if cmd[0] == "D" && !queue.isEmpty {
            if cmd[1].contains("-") {
                queue.sort(by: >)
            } else {
                queue.sort(by: <)
            }
            queue.removeLast()
        }
    }
    return queue.isEmpty ? [0, 0] : [queue.max()!, queue.min()!]
}
