func solution(_ numbers:[Int], _ hand:String) -> String {
    let key = [(3, 1),
               (0, 0), (0, 1), (0, 2),
               (1, 0), (1, 1), (1, 2),
               (2, 0), (2, 1), (2, 2),]
    var left = (3, 0)
    var right = (3, 2)
    var answer = ""

    numbers.forEach { num in
        let leftDist = abs(left.0 - key[num].0) + abs(left.1 - key[num].1)
        let rightDist = abs(right.0 - key[num].0) + abs(right.1 - key[num].1)

        if num.isLeft(){
            left = key[num]
            answer += "L"
        } else if num.isRight() {
            right = key[num]
            answer += "R"
        } else {
            if leftDist < rightDist {
                left = key[num]
                answer += "L"
            } else if leftDist > rightDist {
                right = key[num]
                answer += "R"
            } else {
                if hand == "left" {
                    left = key[num]
                    answer += "L"
                } else {
                    right = key[num]
                    answer += "R"
                }
            }
        }
    }
    return answer
}

extension Int {
    func isLeft() -> Bool {
        return self == 1 || self == 4 || self == 7
    }

    func isRight() -> Bool {
        return self == 3 || self == 6 || self == 9
    }
}
