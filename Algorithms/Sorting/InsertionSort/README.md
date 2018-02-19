# 삽입 정렬(Insertion Sort)
삽입 정렬은 현재 위치에서, 그 이하의 배열들을 비교하여 자신이 들어갈 위치를 찾아, 그 위치에 삽입하는 방식.

![insertionsort](https://user-images.githubusercontent.com/33976758/36380313-227944f6-15c5-11e8-97aa-d438e581c3cb.jpg)

#### 시간복잡도
O(n^2)

이미 정렬되어 있는 경우 한번씩 밖에 비교를 하지 않아 O(n)

#### 소스코드
```Swift
func insertionSort(_ array: [Int]) -> [Int] {
    var arr = array

    for i in 0 ... arr.count - 1 {
        var temp = i
        while temp > 0 && arr[temp] < arr[temp - 1] {
            arr.swapAt(temp - 1, temp)
            temp -= 1
        }
    }

    return arr
}
```
