// Logic 
// 1. x칸 차이 * 두 bar 중 더 낮은 높이 = 너비
// 2. 양 끝에서 시작해서 너비를 구하면서 좁혀나가기
// 3. 두 높이 중 더 낮은 높이에 해당하는 (좌, 우)를 이동시키기 
// 4. 최대 너비를 반환

// Solution
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxWater = 0
        
        while left < right {
            let leftHeight = height[left]
            let rightHeight = height[right]
            let curWater = min(leftHeight, rightHeight) * (right - left)
            
            if curWater > maxWater {
                maxWater = curWater
            } else {
                if leftHeight > rightHeight {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        
        return maxWater
    }
}
