class Solution {
    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        
        while left <= right {
            let temp = s[right]
            
            s[right] = s[left]
            s[left] = temp
            left += 1
            right -= 1
        }
    }
}

