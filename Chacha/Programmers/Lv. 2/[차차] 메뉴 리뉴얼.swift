import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    let orders = orders.map { $0.map { String($0) }.sorted { $0 < $1 } }    
    var result = [String]()
    
    for c in course {
        var popularOrders = [String: Int]()
        
        for order in orders {
            if order.count < c {
                continue
            }
            
            let result = combinations(order, c)    
            result.forEach {                 
                let key = $0.joined(separator: "")
                popularOrders[key, default: 0] += 1
            }            
        }

        guard let maxValue = popularOrders.sorted { $0.value > $1.value }.first?.value,
              maxValue > 1 else {
            continue
        }
        
        popularOrders.filter { $0.value == maxValue }.forEach {
            result.append($0.key)
        }
    }
        
    return result.sorted { $0 < $1 }
}

// 자주 사용하는 조합 코드 
func combinations<T>(_ elements: [T], _ k: Int) -> [[T]] {
    if elements.count == k {
        return [elements]
    }
    if k == 0 {
        return []
    } 
    if k == 1 {
        return elements.map { [$0] }
    }
    var result = [[T]]()
    let subarray = Array(elements.suffix(from: 1))

    let subcombos = combinations(subarray, k-1)
    result += subcombos.map { [elements[0]] + $0 }
    result += combinations(subarray, k)
    return result
}
