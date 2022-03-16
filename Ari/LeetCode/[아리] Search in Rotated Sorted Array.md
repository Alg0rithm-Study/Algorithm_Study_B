## 간단 풀이

> target에 해당하는 index를 반환해야하는 문제.

index, num 튜플로 반복하면서 where로 조건을 준다.
num이 만약 target과 같다면, num에 해당하는 index를 반환한다.
만약 조건에 해당하지 않는다면 -1을 반환한다.


```swift
func search(_ nums: [Int], _ target: Int) -> Int {

  for (index, num) in nums.enumerated() where num == target { 
      return index
  }

  return -1
}
```

## 이진탐색 풀이
> 아래와 같은 규칙으로 target에 해당하는 index를 이진 탐색으로 조회.

<img width="1060" alt="image" src="https://user-images.githubusercontent.com/75905803/158425485-b2a2fd64-05c9-4657-a10e-813bae9b5d40.png">

```swift
func search(_ nums: [Int], _ target: Int) -> Int {
    var min = 0
    var max = nums.count - 1
    var mid = 0

    while min <= max {
        mid = (min + max) / 2
        if nums[mid] == target {
            return mid
        }

        if target >= nums[min] {
            if nums[mid] >= nums[min] && target > nums[mid] { 
                min = mid + 1
            } else {
                max = mid - 1
            }
        } else {
            if nums[mid] >= nums[min] || target > nums[mid] {
                min = mid + 1
            } else {
                max = mid - 1
            }
        }
    }
    return -1
}
```
