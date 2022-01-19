import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failureRates = [(Int, Double)]()
    var failedPeopleCount = 0
    
    let stageCount = Dictionary(stages.map {($0, 1)}, uniquingKeysWith: +)
    
    stageCount.sorted(by: <)
        .forEach { (key, value) in
        if (1...N).contains(key) {
            failureRates.append((key, Double(value) / Double(stages.count - failedPeopleCount)))
            failedPeopleCount += value
        }
    }
    
    return failureRates.sorted { $0.1 > $1.1 }.map { $0.0 }
}
