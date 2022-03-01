import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var stack: [String] = []
    var k = k
    let numbers = number.map { String($0) }
    
    for number in numbers {
        while !stack.isEmpty && stack.last! < number && k > 0 {
            stack.popLast()
            k -= 1
        }
        stack.append(number)
    }
    
    for _ in 0..<k {
        stack.removeLast()
    }
    
    return stack.joined()
}
