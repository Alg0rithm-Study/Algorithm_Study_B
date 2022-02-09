![image](https://user-images.githubusercontent.com/75905803/153156977-7be39add-bfb8-4ad3-8224-baadf27cd1b1.png)

```swift
// 재귀함수
func chageColor(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ color: Int, _ newColor: Int) {
    /*
     탈출조건
     x좌표가 0보다 작거나
     x좌표가 총 image.count만큼 크거나 같거나
     y좌표가 0보다 작거나
     y좌표가 총 image[0].count만큼 크거나 같거나
     좌표에 해당되는 컬러가 해당되지 않을경우
     */
    if (sr < 0 || sr >= image.count || sc < 0 || sc >= image[0].count || image[sr][sc] != color) {
        return
    }
    image[sr][sc] = newColor // 자신의 컬러를 바꾸고
    // 주위 상,하,좌,우 위치에 있는 컬러들도 재귀적으로 함수를 호출하여 newColor로 염색해준다.
    chageColor(&image, sr + 1, sc, color, newColor)
    chageColor(&image, sr - 1, sc, color, newColor)
    chageColor(&image, sr, sc + 1, color, newColor)
    chageColor(&image, sr, sc - 1, color, newColor)
}

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    if image[sr][sc] == newColor { // 현재컬러랑 newColor가 같은경우 걍 리턴
        return image
    }
    var result = image
    chageColor(&result, sr, sc, result[sr][sc], newColor) // 재귀함수
    return result
}
```
