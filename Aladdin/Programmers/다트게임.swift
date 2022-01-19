import Foundation

extension Int {
    func power(of number: Int) -> Int {
        return Int(pow(Double(self), Double(number)))
    }
}

func solution(_ dartResult:String) -> Int {
    var numbers = [0]
    
    for dart in dartResult {
        let numberCount = numbers.count
        if dart == "S" {
            numbers[numberCount - 1] = numbers[numberCount - 1].power(of: 1)
            numbers.append(0)
        } else if dart == "D" {
            numbers[numberCount - 1] = numbers[numberCount - 1].power(of: 2)
            numbers.append(0)
        } else if dart == "T" {
            numbers[numberCount - 1] = numbers[numberCount - 1].power(of: 3)
            numbers.append(0)
        } else if dart == "*" {
            numbers[numberCount - 2] *= 2
            if numbers.count > 2 {
                numbers[numberCount - 3] *= 2
            }
        } else if dart == "#" {
            numbers[numberCount - 2] *= -1
        } else {
            numbers[numberCount - 1] *= 10
            numbers[numberCount - 1] += Int(String(dart))!
        }
    }
    
    return numbers.reduce(0, +)
}

