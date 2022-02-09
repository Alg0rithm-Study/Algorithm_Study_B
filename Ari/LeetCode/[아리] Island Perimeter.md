![](https://i.imgur.com/gGTlyva.png)

```swift
/*
 Logic
 블럭을 조회한다.
 조회하면서 섬(1)에 해당한다면 초기 둘레 4를 생성.
 top 혹은 left에 섬이 존재한다면 2씩 차감
 */
func islandPerimeter(_ grid: [[Int]]) -> Int {
    var totalPerimeter = 0 // 섬의 총 둘레
    for x in grid.indices { // x좌표
        for y in grid[x].indices { // y좌표
            if grid[x][y] == 1 { // 해당하는 좌표의 값이 1이라면...
                var perimeter = 4 // 초기 둘레
                if x - 1 >= 0 && grid[x - 1][y] == 1 { // 바로 위에 블럭이 있다면
                    perimeter -= 2 // 둘레 차감
                }
                if y - 1 >= 0 && grid[x][y - 1] == 1 { // 이전 블럭이 존재했다면
                    perimeter -= 2 // 둘레 차감
                }
                totalPerimeter += perimeter
            }
        }
    }
    return totalPerimeter
}
```
