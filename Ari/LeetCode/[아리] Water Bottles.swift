/*
 [numBottles]을 마신다.
 마셔서 생긴 빈병을 주어진 numExchange으로 교환한다. == 다시 마실 수 있는 [채워진 물병]
 나눠지지 않은 [빈병]은 킵해둔다.
 */
func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
    var drink = 0
    var waterBottles = numBottles
    var emptyBottles = 0
    var keep = 0
    while waterBottles > 0 {
        drink += waterBottles // 물을 마신다
        emptyBottles = waterBottles + keep // 빈병에 마신 물병과 킵했던 물병을 더한다
        waterBottles = emptyBottles / numExchange // 빈병을 교환한다
        keep = emptyBottles % numExchange // 교환하지 못한 병을 킵해둔다.
    }
    return drink
}
