## Logic
<img width="814" alt="image" src="https://user-images.githubusercontent.com/75905803/153754791-86645471-40ca-43b3-8794-e0d7ba5439ef.png">

## 코드
```swift
func maxArea(_ height: [Int]) -> Int {
    let length = height.count
    guard length > 2 else {
        return min(height[0], height[1]) // 총 너비가 3보다 작다면 두개의 숫자중 작은 것을 반환
    }
    var result = 0
    var L = 0 // start Index
    var R = length - 1 // end Index

    while L < R { // start가 end보다 크거나 같으면 반복 끝
        let area = min(height[L], height[R]) * (R - L) // 면적 = 최소값 * 너비
        result = max(result, area) // 결과값을 비교하여 큰 값을 할당
        if height[L] < height[R] { // 마지막으로 start값과 end값을 비교하여 두 포인터를 조정해준다.
            L += 1
        } else {
            R -= 1
        }
    }
    return result
}
```
