// Logic 
// 1. 현재 채워진 병의 개수를 결과값에 우선 저장한다. 
// 2. 처음에는 채워진 병의 개수가 전체 병 개수와 동일 
// 3. 빈 병은 반복문을 돌면서 채우도록 함 
// 4. 채워진 병 + 빈 병의 개수가 교환 단위보다 크거나 같으면 계속 진행 
// 5. 무조건 다 마시기 때문에 빈 병에 이전 채워진 병의 개수 더해주기
// 6. 병을 다시 채워주기 위해, 빈 병을 교환 단위로 나눈 몫을 대입함 
// 7. 빈 병의 개수는 빈 병을 교환 단위로 나눈 후의 나머지 
// 8. 총 마신 병 수를 세어야 하기에 당시 채워진 병의 개수를 결과값에 계속 누적시킴

// Solution  
class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var result = numBottles
        var filledBottles = numBottles
        var emptyBottles = 0
        
        while filledBottles + emptyBottles >= numExchange {
            emptyBottles += filledBottles 
            filledBottles = emptyBottles / numExchange 
            emptyBottles %= numExchange 
            result += filledBottles
        }
        
        return result
    }
}
