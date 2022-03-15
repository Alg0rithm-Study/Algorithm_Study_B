import Foundation
import Darwin

class Solution {
    private func binarySearch(array: [Int], left: Int, right: Int, target: Int) -> Int {
        var left = left, right = right
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if array[mid] == target {
                return mid
            } else if array[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return -1
    }
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        let pivot = left
        let a = binarySearch(array: nums.prefix(pivot).map { $0 }, left: 0, right: pivot - 1, target: target)
        let b = binarySearch(array: nums.suffix(nums.count - pivot).map { $0 }, left: 0, right: nums.count-pivot-1, target: target)
        
        if a == -1 && b != -1 {
            return b + pivot
        }
        if b == -1 && a != -1 {
            return a
        }
        
        return -1
    }
}

