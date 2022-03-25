import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    // n -> 입국심사를 기다리는 사람의 수, times : 심사관이 한명을 보는데 걸리는 수 
    
    var left = 1
    var right = times.max()! * n
    var mid = 0
    var result = 0
    while left <= right {
        mid = (left + right) / 2
        var peoples = 0 
        
        for time in times where peoples < n {
            peoples += (mid / time)
        }
        
        if peoples < n {
            left = mid + 1
        } else {
            right = mid - 1
            result = mid
        } 
    }
    
    return Int64(result)
}