class Solution {
    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        var temp: Character
        
        while left < right {
            temp = s[left]
            s[left] = s[right]
            s[right] = temp
            left += 1
            right -= 1
        }
    }
}
