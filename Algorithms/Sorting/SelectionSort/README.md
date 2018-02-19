# 선택 정렬(Selection Sort)
정렬되지 않은 전체 데이터 중에서 해당 위치에 맞는 자료를 선택하여 위치를 교환하는 정렬 방식.

![selectionsort](https://user-images.githubusercontent.com/33976758/36380521-ee12d38e-15c5-11e8-8429-66f5b3177892.png)

#### 시간복잡도
O(n^2)


#### 소스코드
```Swift
func selectionSort(_ array: [Int]) -> [Int] {
    var arr = array

    for i in 0 ..< arr.count - 1 {
        var lowest = i

        for j in i + 1 ..< arr.count {
            if arr[j] < arr[lowest] {
                lowest = j
            }
        }

        if i != lowest {
            arr.swapAt(i, lowest)
        }
    }

    return arr
}
```
