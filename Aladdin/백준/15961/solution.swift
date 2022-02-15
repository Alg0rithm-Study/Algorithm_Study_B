
let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = inputs[0]
let D = inputs[1]
let K = inputs[2]
let C = inputs[3]

let sushi = readLine()!.split(separator: " ").compactMap { Int($0) }

var sushi_count = Dictionary(sushi.map { ($0, 0) }, uniquingKeysWith: +)

var hasCoupon = false
var left = 0
var right = 0

while right < K {
    sushi_count[sushi[right]]! += 1
    if sushi[right] == C {
        hasCoupon = true
    }
}

var currentDishes = sushi_count.count
var maxDishes = sushi_count.count

if !hasCoupon {
    maxDishes += 1
}

while left < N - 1 {
    if sushi_count[sushi[left]] == 1 {
        if sushi[left] == C {
            hasCoupon = false
        }
        currentDishes -= 1
    }
    sushi_count[sushi[left]]! -= 1
    left += 1
    
    right += 1
    if sushi_count[sushi[right % N]] == C {
        if sushi[right % N] == C {
            hasCoupon = true
        }
        currentDishes += 1
    }
    sushi_count[sushi[right % N]]! += 1
    
    maxDishes = hasCoupon ? max(maxDishes, currentDishes + 1) : max(maxDishes, currentDishes)
}


print(maxDishes)

