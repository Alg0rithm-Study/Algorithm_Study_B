// 1. 각 숫자를 이진법으로 바꾸고
// 2. 1이 있는 곳에 # 추가

import Foundation

extension String {
    func padLeft( totalWidth: Int,byString:String) -> String {
        let toPad = totalWidth - self.count
        if toPad < 1 {
            return self
        }
        
        return "".padding(toLength: toPad, withPad: byString, startingAt: 0) + self
    }
}

extension Int {
    var binaryString: String {
        return String(self, radix: 2)
    }
}

func convertToBinaryArray(from number: Int, paddingWidth: Int) -> [Character] {
    return number.binaryString
        .padLeft(totalWidth: paddingWidth, byString: "0")
        .map { $0 }
}

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n {
        let binaryArray1 = convertToBinaryArray(from: arr1[i], paddingWidth: n)
        let binaryArray2 = convertToBinaryArray(from: arr2[i], paddingWidth: n)
        var row = ""
        
        for j in 0..<n {
            if binaryArray1[j] == "1" || binaryArray2[j] == "1" {
                row += "#"
            } else {
                row += " "
            }
        }
        answer.append(row)
    }
    return answer
}

//01001
//11110
//10100
//00001
//11100
//10101
//10010
//10001
//01011
//11100

//101110
//011011
//100001
//111000
//100001
//010011
//010110
//001110
//011111
//001110
//110010
//001010

