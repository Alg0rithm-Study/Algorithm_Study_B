import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var numbers = number.compactMap { Int(String($0)) }
    
    var chance = k
    var tempNumbers: [Int] = []
    var idx = 0
    var count = 0
    
    outerLoop: while chance != 0 && idx < numbers.count {
        let number = numbers[idx]
        
        while chance != 0 {
            guard let lastNumber = tempNumbers.last else {
                tempNumbers.append(number)
                idx += 1
                continue outerLoop 
        }
            if number > lastNumber {
                tempNumbers.removeLast()
                chance -= 1
            } else {
                break
            }
        }
        tempNumbers.append(number)
        idx += 1
    }
 
    tempNumbers.append(contentsOf: numbers[idx...])    
    
    if chance > 0 {
        tempNumbers = Array(tempNumbers[0...(tempNumbers.count - 1 - chance)])
    }
    
    let newNumbers = tempNumbers.map { String($0) }.reduce("", +)
    
    return newNumbers
}