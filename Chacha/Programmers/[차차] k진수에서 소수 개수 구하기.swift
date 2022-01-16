// Logic 
// 1. 0으로 나눈 숫자들이 소수인지 판별
// 2. 소수 판단 로직은 sqrt를 사용하여 O(sqrt(N))이 되도록 한다.

// Solution
import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let convertedNumbers = String(n, radix: k).split(whereSeparator: { $0 == "0" }).compactMap { Int($0) }
    return convertedNumbers.filter { isPrime($0) }.count
}

func isPrime(_ num: Int) -> Bool {
    if num < 2 { return false }
    var i = 2
    
    while Int(sqrt(Double(num))) >= i {
        guard num % i != 0 else { 
            return false
        }
        i += 1
    }
    return true
}
