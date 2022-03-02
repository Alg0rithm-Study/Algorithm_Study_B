import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var students = [Int](repeating: 1, count: n)

    lost.forEach { 
        students[$0 - 1] = 0
    }

    reserve.forEach {
        students[$0 - 1] += 1
    }
    
    for (idx, student) in students.enumerated() {
        if student == 0 {
            // idx > 0 조건이 뒤에 위치하게 되면 인덱스를 벗어나 크래시가 나게 된다.
            if idx > 0 && students[idx - 1] > 1  {
                students[idx] = 1
                students[idx - 1] -= 1
            }
            else if idx < n - 1 && students[idx + 1] > 1 {
                students[idx] = 1
                students[idx + 1] -= 1
            }
        }
    }
    
    return students.filter { $0 > 0 }.count
}