import Foundation

func isPrime(_ number: Int) -> Bool {
    if number == 1 {
        return false
    }
    if number == 2 || number == 3 {
        return true
    }
    let n = Int(sqrt(Double(number)))
    for i in 2...n {
        if number % i == 0 {
            return false
        }
    }
    return true
}

func solution(_ n:Int, _ k:Int) -> Int {
    let convert = String(n, radix: k)
    let numbers = convert.split(separator: "0")
    return numbers.filter {isPrime(Int($0)!)}.count
}
