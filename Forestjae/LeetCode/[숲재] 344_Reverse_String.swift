//
//  [숲재] 344_Reverse_String.swift
//  
//
//  Created by 이승재 on 2022/02/13.
//

import Foundation

class Solution {
    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1

        while left < right {
            let newRight = s[left]
            s[left] = s[right]
            s[right] = newRight
            left += 1
            right -= 1
        }
    }
}
