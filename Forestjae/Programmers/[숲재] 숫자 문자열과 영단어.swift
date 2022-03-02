import Foundation

func solution(_ s:String) -> Int {

    var string = s
    let dic: [String:Int] = ["zero":0, "one":1, "two":2, "three":3, "four":4, "five":5, "six":6, "seven":7, "eight":8, "nine":9]

    dic.forEach { key, value in
        string = string.replacingOccurrences(of: key, with: String(value))
    }

    return Int(string)!
}
