func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n {
        var bit = String(arr1[i] | arr2[i], radix: 2)
        bit = String(repeating: "0", count: n - bit.count) + bit
        answer += [bit.reduce("") { $0 + ($1 == "1" ? "#" : " ") }]
    }
    return answer
}
