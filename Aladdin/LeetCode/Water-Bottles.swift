class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var totalBottles = numBottles
        var drinkCount = numBottles

        while totalBottles >= numExchange {
            let (newBottles, remainingBottles) = totalBottles.quotientAndRemainder(dividingBy: numExchange)

            drinkCount += newBottles 
            totalBottles = newBottles + remainingBottles 
        }
    }
}
