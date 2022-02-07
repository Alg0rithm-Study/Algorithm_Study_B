import Foundation

func split(from string: String) -> (String, String) {
    let splitData = string.split(separator: " ").map { String($0) }
    return (splitData[0], splitData[1])
}

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var answer = Array(repeating: 0, count: id_list.count)
    var id_index: [String: Int] = [:]
    var reported_reporters: [String: Set<String>] = [:]
        
    for (index, id) in id_list.enumerated() {
        id_index[id] = index
    }
    
    for data in report {
        let (reporter, reported) = split(from: data)
        
        if reported_reporters[reported] != nil {
            reported_reporters[reported]!.insert(reporter)
        } else {
            reported_reporters[reported] = [reporter]
        }
    }
    
    for (_, reporters) in reported_reporters {
        if reporters.count >= k {
            for id in reporters {
                answer[id_index[id]!] += 1
            }
        }
    }
    
    return answer
}
