import Foundation

extension Int {
    var isPrime: Bool {
        if self < 4 {
            return self == 1 ? false : true
        }
        for i in 2...Int(sqrt(Double(self))) {
            if(self % i == 0) {
                return false
            }
        }
        return true
    }
}

func solution(_ n:Int, _ k:Int) -> Int {
    return String(n, radix: k)
    .split(separator: "0")
    .filter { Int($0)!.isPrime }
    .count
}

