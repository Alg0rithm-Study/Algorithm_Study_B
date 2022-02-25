/*
 먼저 전체 학생의 수에서 도난 당한 학생의 수만큼 뺀다.
 그리고 도난 당한 학생, 여벌이 있는 학생을 정렬한다.
 도난당함과 동시에 여벌이 있는 학생을 필터링한다. (수업들을 학생에 +1해주고 두 배열에서 제거)
 이후 앞과 뒷번호 학생이 여벌이 있다면 수업들을 학생에 추가해주고 여벌이 있는 학생을 지워준다.
 */

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var listen = n - lost.count // 도난 당한 학생 수를 빼기
    var lost = lost.sorted()
    var reserve = reserve.sorted()

    for lose in lost {
        if reserve.contains(lose) { // 도난당함과 동시에 여벌이 있는 학생에 존재한다면
            let index = reserve.firstIndex(of: lose)!
            reserve.remove(at: index)
            let index2 = lost.firstIndex(of: lose)! 
            lost.remove(at: index2) // 두 배열에서 모두 제거, 그리고 수업들을 수 있는 학생에 추가해주기
            listen += 1
        }
    }
    
    for lose in lost {
        let front = lose - 1 // 앞
        let back = lose + 1 // 뒤
        
        if reserve.contains(front) { // 앞, 혹은 뒷번호에 학생이 존재한다면 체육복 빌리고 수업듣기~
            let index = reserve.firstIndex(of: front)!
            reserve.remove(at: index)
            listen += 1
        } else if reserve.contains(back) {
            let index = reserve.firstIndex(of: back)!
            reserve.remove(at: index)
            listen += 1
        }
    }
    
    return listen
}
