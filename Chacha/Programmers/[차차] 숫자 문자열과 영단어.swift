// Logic
// 1. 숫자와 단어를 매칭시키는 딕셔너리 생성
// 2. 딕셔너리를 순회하며 대상 문자열에서 해당하는 값을 숫자로 변환
// 3. 문자열 형태의 숫자를 Int형으로 변환

// Solution
import Foundation

func solution(_ s:String) -> Int {
    var numbers = ["zero":"0", "one":"1", "two":"2", "three":"3", "four":"4", "five":"5", "six":"6", "seven":"7", "eight":"8", "nine":"9"]
    var result = s
    
    numbers.forEach { number in
        result = result.replacingOccurrences(of: number.key, with: number.value)
    }
        
    return Int(result)!
}
