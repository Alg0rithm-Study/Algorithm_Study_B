import Foundation

func solution(_ records: [String]) -> [String] {
    var uidName = [String: String]()
    var history = [[String]]()
    var result = [String]()
    
    records.map { record in 
        let info = record.components(separatedBy: " ")
        let action = info[0], uid = info[1]

        switch action {                     
        case "Enter":
            let name = info[2]
            uidName[uid] = name
            history.append([uid, action])
        case "Leave":
            history.append([uid, action])
        case "Change":
            uidName[uid] = info[2]    
        default: 
            break
        }         
    }
    
    history.forEach {
        let name = uidName[$0[0]]!, action = $0[1]
        switch action {
        case "Enter":
            result.append("\(name)님이 들어왔습니다.")
        case "Leave":
            result.append("\(name)님이 나갔습니다.")
        default:
            break
        }
    }
    
    return result
}
