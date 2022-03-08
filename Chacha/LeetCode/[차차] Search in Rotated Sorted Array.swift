// Logic 
// 1. 배열의 좌, 우는 최대값으로 나눠서 판단해볼 수 있다.
// 2. 좌측 인덱스의 값이 중간값보다 작은 경우 왼쪽 배열에 해당한다. 
    // 3. 그 중에서도 왼쪽 배열 내에 타겟이 있는 경우 범위를 좁히기 위해 rhs = mid - 1을 해준다. 
    // 4. 만약 target이 좌측 배열의 최소값보다 작다면 우측 배열로 이동해주기 위해 lhs = mid + 1을 해준다. 
// 5, 좌측 인덱스의 값이 중간값보다 큰 경우이다. 즉 중간값의 위치가 우측 배열에 있다는 것
    // 6. 증긴깂은 타겟보다 작고, 우측인덱스의 값은 타겟보다 크거나 같을 경우 우측 배열에 속한다고 볼 수 있다. 이에 lhs = mid + 1
    // 7. 우측 배열에 포함되지 않는다면 좌측 배열로 이동해야하기 때문에 rhs = mid - 1 실행
// 8. while문을 탈출한 경우에는 lhs or rhs를 기준으로 타겟과 같은지 비교하고 아니라면 -1 출력

// Solution
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var lhs = 0, rhs = nums.count - 1
        
        while lhs < rhs {
            let mid = (lhs + rhs) / 2
            
            if nums[mid] == target {
                return mid                
            } else if nums[lhs] <= nums[mid] {
                if nums[mid] > target && nums[lhs] <= target {
                    rhs = mid - 1
                } else {
                    lhs = mid + 1
                }
            } else {
                if nums[mid] < target && nums[rhs] >= target {
                    lhs = mid + 1 
                } else {
                    rhs = mid - 1
                }
            }
        }
        
        return nums[rhs] == target ? lhs : -1
    }
}
