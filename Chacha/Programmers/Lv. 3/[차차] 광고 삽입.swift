import Foundation

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    if play_time == adv_time {
        return "00:00:00"
    }
    
    var totalTimeline = Array(repeating: 0, count: convertToSecond(play_time)+1)
    var advTime = convertToSecond(adv_time)
    
    logs.map { log in 
              let separatedLog = log.components(separatedBy: "-")
              let startTime = convertToSecond(separatedLog[0]), endTime = convertToSecond(separatedLog[1])
              
              totalTimeline[startTime] += 1
              totalTimeline[endTime] -= 1             
          }
    
    for i in 1..<totalTimeline.count {
        totalTimeline[i] += totalTimeline[i-1]        
    }
    
    let maxTotalTime = totalTimeline.max()!
    
    var result = totalTimeline[0..<advTime].reduce(0,+)
    var maxTime = result
    var advStartTime = 0
    
    for i in advTime..<totalTimeline.count { 
        result += totalTimeline[i] - totalTimeline[i - advTime]
        
        if maxTime < result {
            maxTime = result
            advStartTime = i - advTime + 1
        }        
    }
    
    return convertToTime(advStartTime)
}

func convertToTime(_ second: Int) -> String {
    var second = second
    let hour = second / 3600
    let hourString = hour < 10 ? "0\(hour)" : "\(hour)"
    second %= 3600 
    let minute = second / 60
    let minuteString = minute < 10 ? "0\(minute)" : "\(minute)"
    second %= 60
    let secondString = second < 10 ? "0\(second)" : "\(second)"
    
    return [hourString, minuteString, secondString].joined(separator: ":")
}

func convertToSecond(_ time: String) -> Int {
    let time = time.components(separatedBy: ":")
    let hour = Int(time[0])! * 60 * 60
    let minute = Int(time[1])! * 60
    let second = Int(time[2])!
    return hour + minute + second
}
