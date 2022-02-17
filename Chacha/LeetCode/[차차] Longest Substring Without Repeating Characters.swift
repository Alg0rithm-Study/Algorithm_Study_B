// Logic 
// 1. sub 문자를 저장 
// 2. 새로 들어올 문자가 포함되어 있으면 처음부터 ~ 중복 문자열까지 모두 제거 
// 3. 새로운 문자 추가하고 최대 길이 저장 

// Solution
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var sub = [Character](), maxSub = 0
        
        s.map { 
            if sub.contains($0) {
                sub.removeSubrange(0...sub.firstIndex(of: $0)!)
            }
            sub.append($0)
            maxSub = max(maxSub, sub.count)
        }
        
        return maxSub
    }
}         
