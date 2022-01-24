// Logic
// 0. records를 돌며 [차량번호: [(내역, 시간)]] 의 정보를 cars에 담아둔다.
// 1. 결과는 [차량번호: 요금] 타입으로 선언
// 2. 최대 출차시간을 maxTime에 저장해둔다.
// 3. cars의 (내역: 시간) 정보를 뒤집어서 OUT이 먼저 나오는 경우 그대로 (OUT시간-IN시간) 연산을 진행
// 4. OUT이 아니라 IN이 나왔을 때 출차 시간이 없을 경우 maxTime에서 뺀다. 
// 5. 공식에 따라 요금 계산
// 5. 차량 번호 순으로 요금 정렬하여 반환

// Solution
import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var result = [String: Int]()
    var cars = [String: [(String, Int)]]()
    let baseTime = fees[0], baseFee = fees[1], unitTime = fees[2], unitFee = fees[3]
    let maxTime = 23 * 60 + 59 
    
    for record in records {
        let splitedRecord = record.components(separatedBy: " ")    
        let time = convertToMinute(splitedRecord[0])
        let carNumber = splitedRecord[1]
        let type = splitedRecord[2]
        
        if let _ = cars[carNumber] {
            cars[carNumber]!.append((type, time))
        } else {
            cars[carNumber] = [(type, time)]
        }
    }
    
    for (car, info) in cars {
        var totalTime = 0
        var exitTime = maxTime
        
        for (type, time) in info.reversed() {
            if type == "OUT" {
                exitTime = time
            } else {
                totalTime += exitTime - time                
            }
        }
        
        if totalTime <= baseTime {
            result[car] = baseFee
        } else {
            result[car] = baseFee + Int(ceil(Double(totalTime - baseTime) / Double(unitTime))) * unitFee
        }                
    }
    
    return result.sorted { $0.key < $1.key }.map { $0.value }
}

func convertToMinute(_ time: String) -> Int {
    let splitedTime = time.components(separatedBy: ":")
    let hour = Int(splitedTime[0])! * 60
    let minute = Int(splitedTime[1])!
    return hour + minute
}
