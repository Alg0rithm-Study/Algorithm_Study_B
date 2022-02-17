import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var result: [String] = Array(repeating: "", count: n)
    //result.append(contentsOf: repeatElement("", count: n))

    (0..<n).forEach {
        var binaryMap = String(arr1[$0] | arr2[$0], radix: 2)

        binaryMap = String(repeating: "0", count: n - binaryMap.count) + binaryMap

        for binaryNumber in binaryMap {
            result[$0] += binaryNumber == "1" ? "#" : " "
        }
    }

    return result
}
