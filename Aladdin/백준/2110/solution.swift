func getAdapterCount(_ gap: Int, _ numbers: [Int]) -> Int {
    var count = 1
    var previousNumber = numbers[0]
    for i in 1..<numbers.count {
        if numbers[i] - previousNumber >= gap {
            count += 1
            previousNumber = numbers[i]
        }
    }
    return count
}

func binarySearch(_ left: Int, _ right: Int, _ numbers: [Int], _ C: Int) -> Int {
    var answer = 0
    var left = left
    var right = right
    while left <= right {
        let gap = left + (right - left) / 2
        let count = getAdapterCount(gap, numbers)
        if count >= C {
            left = gap + 1
            answer = gap
        } else {
            right = gap - 1
        }
    }
    return answer
}

func solution() {
    let NC = readLine()!.split(separator: " ")
        .compactMap { Int($0) }

    let N = NC[0]
    let C = NC[1]

    var numbers: [Int] = []

    for _ in 0..<N {
        let data = Int(readLine()!)!
        numbers.append(data)
    }

    numbers.sort()

    let left = 1
    let right = numbers.last! - numbers.first!
    print(binarySearch(left, right, numbers, C))
}

solution()
