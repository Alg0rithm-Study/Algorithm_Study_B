/* Logic 
0. 시간의 총합이 k 보다 작다면 가능하지 않음
1. 소요시간 기준 내림차순 정렬
2. 뒤에서부터 (시간 * 현재 개수) 만큼 k에서 빼주기
3. k가 0보다 작아지면 그만 
4. 앞에서부터 k를 현재 개수로 나눈 나머지를 더한 위치가 먹어야 할 위치
*/

// Solution
import Foundation

func solution(_ food_times:[Int], _ k:Int64) -> Int {    
    guard food_times.reduce(0,+) > k else { 
        return -1 
    }
    
    var foodTimes = food_times.enumerated().sorted { $0.element > $1.element }
    var latestTime = 0
    var k = Int(k)
    
    while k > (foodTimes.count * (foodTimes.last!.element - latestTime)) {  
        let count = foodTimes.count
        let firstTime = foodTimes.removeLast().element
        k -= (count * (firstTime - latestTime))  
        latestTime = firstTime
    }
        
    return foodTimes.sorted { $0.offset < $1.offset }[k % foodTimes.count].offset + 1
}
