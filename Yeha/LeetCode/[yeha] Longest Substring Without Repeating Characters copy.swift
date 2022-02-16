class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxCount = 0
        var currentSubstring = [Character]()

        for char in s {
            if let index = currentSubstring.firstIndex(of: char) {
                currentSubstring.removeFirst(index + 1)
            }
            currentSubstring.append(char)
            maxCount = max(maxCount, currentSubstring.count)
        }
        return maxCount
    }
}
