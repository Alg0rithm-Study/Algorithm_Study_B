func solution(_ s:String) -> Int {
    let number = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    var answer = s

    for num in 0...9 {
        answer = answer.replacingOccurrences(of: number[num], with: "\(num)")
    }

    return Int(answer)!
}
