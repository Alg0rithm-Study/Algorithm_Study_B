//
//  [숲재] 3_Longest Substring.swift
//  
//
//  Created by 이승재 on 2022/02/13.

// MARK: - for-in으로 로직 개선

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
    var tempString = ""
    var answer = 0

    for character in s {
        if !tempString.contains(character) {
            tempString.append(character)
        } else {
            answer = max(answer, tempString.count)

            let index = tempString.index(tempString.startIndex, offsetBy: 1)
            if tempString[..<index] == String(character) {
                tempString = tempString.replacingOccurrences(of: String(character), with: "")
            } else {
                if let index = tempString.firstIndex(of: character) {
                    let newIndex = tempString.index(after: index)
                    tempString = String(tempString[newIndex...])
                }
            }

            tempString.append(character)
        }
    }

    return max(answer, tempString.count)
    }
}



// MARK: - 시간초과 풀이
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s == "" {
            return 0
        }
        var left = 0
        var windowSize = 1
        var tempAnswer = 1

        while (left + windowSize <= s.count) && (tempAnswer + left <= s.count) {
            let slicedString = sliceStringToFitTheSize(string: s, start: left, size: windowSize)
            if isNotRepeatingChar(slicedString) {
                if windowSize > tempAnswer {
                    tempAnswer = windowSize
                }
                windowSize += 1
                continue
            } else {
                windowSize -= 1
                left += 1
                continue
            }
        }
        return tempAnswer
    }

    func isNotRepeatingChar(_ s: String) -> Bool {
        if Set(s).count == s.count {
            return true
        } else {
            return false
        }
    }

    func sliceStringToFitTheSize(string: String, start: Int, size: Int) -> String {
        let startIndex = string.index(string.startIndex, offsetBy: start)
        let endIndex = string.index(startIndex, offsetBy: size)

        return String(string[startIndex..<endIndex])
    }
}
