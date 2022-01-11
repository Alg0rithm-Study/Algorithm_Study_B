// Logic 
// 1. 배열을 2진법으로 변환
// 2. 각 배열의 각 원소들을 비교하여 하나라도 1인 경우 "#", 아니면 " "
// 3. 문자열 배열 반환

// Solution
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    let convertedArr1 = arr1.map { convertToBinary($0, n)}
    let convertedArr2 = arr2.map { convertToBinary($0, n)}
    var result = [String]()
        
    zip(convertedArr1, convertedArr2).forEach { (cArr1, cArr2) in
        var convertedString = ""
        zip(cArr1, cArr2).forEach {
            convertedString += ($0 == "1" || $1 == "1") ? "#" : " "
        }
        result.append(convertedString)                                               
    }
    
    return result
}

func convertToBinary(_ number: Int, _ n: Int) -> String {
    var converted = String(number, radix: 2)
    return String(repeating: "0", count: n - converted.count) + converted
}

// 개선 풀이 : 비트 연산자 사용, reduce 사용
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {    
    return (0..<n).map { 
        let binary = String(arr1[$0]|arr2[$0], radix: 2)
        let filled = String(repeating: "0", count: n - binary.count) + binary
        return filled.reduce("") { $0 + ($1 == "1" ? "#" : " ")}
    }    
}
