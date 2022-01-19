import Foundation

extension Sequence {
   func sorted(
     by firstPredicate: (Element, Element) -> Bool,
     _ secondPredicate: (Element, Element) -> Bool,
     _ otherPredicates: ((Element, Element) -> Bool)...
   ) -> [Element] {
     return sorted(by:) { lhs, rhs in
       if firstPredicate(lhs, rhs) { return true }
       if firstPredicate(rhs, lhs) { return false }
       if secondPredicate(lhs, rhs) { return true }
       if secondPredicate(rhs, lhs) { return false }
       for predicate in otherPredicates {
         if predicate(lhs, rhs) { return true }
         if predicate(rhs, lhs) { return false }
       }
       return false
     }
   }
 }

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failRates: [Int: Double] = [:] //[stage 번호: 실패율]
    
    for stage in 1..<N+1 {
        // stage가 몇 번 있는지 count
        let stageCount = stages.filter{ $0 >= stage }.count
        //클리어한 수
        let clearedCount = stageCount - stages.filter{ $0 > stage }.count
        failRates[stage] = Double(clearedCount) / Double(stageCount)
    }
    
    // let sortedDict = failRates.sorted(by:
    //                                     { $0.1 > $1.1 },
    //                                   { $0.0 < $1.0 }
    //     )
    let sortedDict = failRates.sorted(by: <).sorted(by: {$0.value > $1.value})
    return sortedDict.map { $0.key }
}

