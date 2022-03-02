//
//  [숲재] 11_Container_With_Most_Water.swift
//  
//
//  Created by 이승재 on 2022/02/13.
//

import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        func area(leftIndex: Int, rightIndex: Int) -> Int {
            return min(height[leftIndex], height[rightIndex]) * (rightIndex - leftIndex)
        }
        var left = 0
        var right = height.count - 1
        var tempArea = 0
        while left < right {
            let currentArea = area(leftIndex: left, rightIndex: right)
            if currentArea > tempArea {
                tempArea = currentArea
            }

            if height[left] >= height[right] {
                right -= 1
            } else {
                left += 1
            }
        }
        return tempArea
    }


}
