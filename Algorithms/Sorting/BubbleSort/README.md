# 버블 정렬(Bubble Sort)
연속된 두개 인덱스를 비교하여, 정한 기준의 값을 뒤로 넘겨 정렬하는 방식.

![bubblesort](https://user-images.githubusercontent.com/33976758/36381067-c2bdbcd8-15c7-11e8-9644-84d6c8826431.png)

#### 시간복잡도
O(n^2)

#### 소스코드
```Swift
func bubbleSort(_ array: [Int]) -> [Int] {
    var arr = array

    for i in 0 ..< arr.count {
        for j in 0 ..< arr.count - 1 {
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
            }
        }
    }
    return arr
}
```
