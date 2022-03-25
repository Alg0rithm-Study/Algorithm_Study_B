import Foundation

func solution(_ record:[String]) -> [String] {
    
    var idMatch: [String: String] = [:]
    let records = record.map { $0.components(separatedBy: " ") }
    for r in records {
        if r[0] == "Enter" || r[0] == "Change" {
            idMatch[r[1]] = r[2]
        } 
    }
    var result: [String] = []
    for r in records {
        
        if r[0] == "Enter" {
            let string = "\(idMatch[r[1]]!)님이 들어왔습니다."
            result.append(string)
        } else if r[0] == "Leave" {
            let string = "\(idMatch[r[1]]!)님이 나갔습니다."
            result.append(string)
        }
        
    }
    
    
    
    return result
}