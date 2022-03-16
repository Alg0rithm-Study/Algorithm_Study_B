/*
이분 탐색으로 풀이
입력 두줄을 받아서 split으로 자르고 compactMap으로 Int 변환처리

min, max를 선언하고 min, max로 미드값을 잡아준다.
mid값을 trees를 반복하면서 값을 빼준다. (나무 자르기) 이때 이 값을 sum에 더해준다.
sum이 구하려는 target보다 큰지 작은지를 비교하며, min, max를 조절한다.
   - target이 클 경우 max에 mid값을 할당
   - sum이 클 경우 mid를 result에 할당해주고, min의 값을 mid에 1을 더해서 할당
*/

let input = readLine()!
let trees = readLine()!

func solution(input: String, trees: String) -> Int {
    let input = input.split(separator: " ").compactMap { Int($0.description) }
    let trees = trees.split(separator: " ").compactMap { Int($0.description) }
    let target = input[1]
    
    var min = 0
    var max = trees.max()!
    var mid = 0
    var result = 0
    
    while min < max {
        mid = (min + max) / 2
        var sum = 0
        
        for tree in trees where tree > mid {
            sum += tree - mid
        }
        
        if target > sum {
            max = mid
        } else {
            result = mid
            min = mid + 1
        }
        
    }
    
    return result
}

print(solution(input: input, trees: trees))
