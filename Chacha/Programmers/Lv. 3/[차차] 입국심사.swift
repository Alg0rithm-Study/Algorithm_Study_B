import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var lhs = 0, rhs = times.max()! * n
    var answer = 0
    
    while lhs <= rhs {
        let mid = (lhs + rhs) / 2
        
        let passed = times.map { mid / $0 }.reduce(0,+)
        
        if passed >= n {
            answer = mid
            rhs = mid - 1            
        } else if passed < n {
            lhs = mid + 1
        }
    }
        
    return Int64(answer)
}
