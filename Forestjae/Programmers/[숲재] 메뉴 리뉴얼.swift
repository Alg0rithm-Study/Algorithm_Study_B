import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var db: [Int: [String: Int]] = [:]

    course.forEach { number in
        db[number] = [:]
        orders.forEach { order in
            if number > order.count {
                return
            }
            let combs = combinations(order.map { String($0) }, number).map { $0.sorted().joined()}
            combs.forEach { comb in
                if db[number]!.keys.contains(comb) {
                    db[number]![comb]! += 1
                } else {
                    db[number]![comb] = 1
                }
            }
        }
    }

    var result = [String]()
    for number in course {
        let stringArray = db[number]!.filter { $0.value > 1 }
        let max = stringArray.values.max()
        let stringArray2 = stringArray.filter { $0.value == max }
        stringArray2.forEach { result.append($0.key) }
    }

    return result.sorted()
}

func combinations<T>(_ elements: [T], _ k: Int) -> [[T]] {
    if elements.count == k { return [elements] }
    if k == 0 { return [] }
    if k == 1 { return elements.map { [$0] } }
    var result = [[T]]()
    let subarray = Array(elements.suffix(from: 1))
    let subcombos = combinations(subarray, k-1)
    result += subcombos.map { [elements[0]] + $0 }
    result += combinations(subarray, k)
    return result
}