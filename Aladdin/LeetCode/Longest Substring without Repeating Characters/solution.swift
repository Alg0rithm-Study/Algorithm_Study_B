class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var repeatedLetter_index: [Character: Int] = [:]
        var maxLength = 0
        var leftPointer = 0
        
        for (rightPointer, value) in s.enumerated() {
            if repeatedLetter_index[value] != nil && leftPointer <= repeatedLetter_index[value]! { // 중복 된게 있고, 슬라이딩 윈도우 시작 위치 갱신
                leftPointer = repeatedLetter_index[value]! + 1
            } else {
                maxLength = max(maxLength, rightPointer - leftPointer + 1)
            }
            repeatedLetter_index[value] = rightPointer
        }
        return maxLength
    }

}
