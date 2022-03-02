import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var result = Array<Int>(1...N)

    var infos: [(Int, Int, Double)] = []

    (1...N+1).forEach {
        infos.append(($0, 0, 0))
    }

    for stage in stages {
        infos[stage-1] = (infos[stage-1].0, infos[stage-1].1 + 1, 0)
    }

    var numberOfPlayer = stages.count
    for i in (0...infos.count-1) {
        if numberOfPlayer != 0 {
            infos[i].2 = Double(infos[i].1) / Double(numberOfPlayer)
        } else {
            infos[i].2 = 0
        }
        numberOfPlayer -= infos[i].1
    }

    result.sort(by: {
        infos[$0-1].2 > infos[$1-1].2
    })

    return result
}
