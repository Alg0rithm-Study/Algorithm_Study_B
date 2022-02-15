class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var letter_count: [Character: Int] = [:]
        var maxLength = 0
        var leftPointer = 0
        
        for (rightPointer, value) in s.enumerated() {
            if letter_count[value] != nil && leftPointer <= letter_count[value]! { // 중복 된게 있으면 슬라이딩 윈도우 시작 위치 이동
                leftPointer = letter_count[value]! + 1
            } else {
                maxLength = max(maxLength, rightPointer - leftPointer + 1)
            }
            letter_count[value] = rightPointer
        }
        return maxLength
    }

}
