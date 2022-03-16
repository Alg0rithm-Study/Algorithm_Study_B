/*
문자열을 for-in문으로 반복한다.
반복하면서 문자를 keep 배열에 저장한다.
result에 max를 활용해서 가장 큰 수를 저장한다.

조건문을 통해 만약 keep 배열에 현재 문자의 index가 존재한다면 removeSubrange 메소드를 활용해서, 해당 범위를 지운다
= 인덱스가 있다는 것은 중복되는 문자가 존재한다는 뜻이기도 하다.
*/
func lengthOfLongestSubstring(_ s: String) -> Int {
    var result = 0
    var keep = [Character]() // 겹치지않는 문자열을 저장할 배열
    
    for element in s {
        if let index = keep.firstIndex(of: element) { // 인덱스가 바인딩이 된다면
            keep.removeSubrange(0...index) // 그 인덱스를 가지고 킵해둔 문자열을 0부터 index까지 지우기
        }
        keep.append(element)
        result = max(result, keep.count)
    }
    return result
}
