import Foundation

func calculateFee(_ totalMinutes: Int,_ fees: [Int]) -> Int {
    let defaultTime = fees[0]
    let defaultFee = fees[1]
    let payableTime = fees[2]
    let fee = fees[3]

    guard totalMinutes > defaultTime else {
        return defaultFee
    }
    let extraFee = Int(ceil(Double(totalMinutes - defaultTime) / Double(payableTime))) * fee

    return defaultFee + extraFee
}

func convertToMinutes(from timeStamp: String) -> Int {
    let timeData = timeStamp.split(separator: ":")
    let hours = Int(timeData[0])!
    let minutes = Int(timeData[1])!

    return 60 * hours + minutes
}

func split(from record: String) -> (String, String, String) {
    let splitData = record.split(separator: " ")
    let timeStamp = String(splitData[0])
    let id = String(splitData[1])
    let state = String(splitData[2])

    return (timeStamp, id, state)
}

//fees
//0: 기본 시간
//1: 기본 요금
//2: 단위 시간
//3: 단위 요금
//
//records
//시각 / 차량번호 / IN/OUT
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var carID_parkedTime: [String: Int] = [:]
    var carID_totalTime: [String: Int] = [:]
    let maxTime = convertToMinutes(from: "23:59")

    for record in records {
        let (timeStamp, carID, state) = split(from: record)
        let timeInMinutes = convertToMinutes(from: timeStamp)

        if state == "IN" {
            carID_parkedTime[carID] = timeInMinutes
        } else {
            let driveOutTime = timeInMinutes
            let minutes = driveOutTime - carID_parkedTime[carID]!

            if carID_totalTime[carID] == nil {
                carID_totalTime[carID] = minutes
            } else {
                carID_totalTime[carID]! += minutes
            }
            carID_parkedTime[carID] = nil
        }
    }

    for (number, time) in carID_parkedTime {
        if carID_totalTime[number] == nil {
            carID_totalTime[number] = maxTime - time
        } else {
            carID_totalTime[number]! += maxTime - time
        }
    }

    var id_fee: [String: Int] = [:]

    for (id, totalTime) in carID_totalTime {
        id_fee[id] = calculateFee(totalTime, fees)
    }

    return id_fee
        .sorted{$0.0 < $1.0}
        .map{ $0.1 }
}
