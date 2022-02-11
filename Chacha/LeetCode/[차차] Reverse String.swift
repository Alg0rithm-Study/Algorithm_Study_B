// Logic 
// 1. 왼쪽, 오른쪽 인덱스를 초기화한다.
// 2, 왼쪽 인덱스가 오른쪽 인덱스와 같아지기 전까지 반복한다
// 3. 왼쪽 인덱스에 해당하는 값과 오른쪽 인덱스에 해당하는 값을 바꿔준다. 
// 4. 그리고 left를 우측으로 한 칸 이동, right를 왼쪽으로 한 칸 이동한다. 

// Solution
class Solution {
    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        
        while left < right {
            var temp = s[left]
            s[left] = s[right]
            s[right] = temp   
            // s.swapAt(left, right)도 가능 
            left += 1
            right -= 1
        }
    }
}
