// 1. 제시된 범위의 숫자(0~9)를 모두 더한다
// 2. 1에서 더한 값에 인자로 들어온 numbers를 더한 값을 빼준다

func solution(_ numbers:[Int]) -> Int {
    return 45 - numbers.reduce(0, +)
}

// 제시된 범위가 손으로 계산할 수 없다면
// 1. 제시된 범위 내에서 numbers에 포함되지 않는 수만 골라서
// 2. 고른 값을 reduce로 더해준다

//func solution(_ numbers:[Int]) -> Int {
//    return (0...9).filter { !numbers.contains($0) }.reduce(0, +)
//}
