class Solution {
    func getMaxArea(_ height: [Int]) -> Int {
        guard !height.isEmpty else {
            return -1
        }
    
        var maxArea = 0
        var left = 0
        var right = height.count - 1
    
        while left < right {
            // 계산
            let minHeight = min(height[left], height[right])
            let currentHeight = minHeight * (right - left)
            maxArea = max(maxArea, currentHeight)
            // 포인터 이동
            if height[left] <= height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
    
        return maxArea
    }

    func maxArea(_ height: [Int]) -> Int {
        return getMaxArea(height)
    }
}
