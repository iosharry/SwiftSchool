# 퀵 정렬(Quick Sort)
pivot을 선정하여 pivot을 기준으로 좌측과 우측으로 pivot보다 작은값은 왼쪽 pivot보다 큰값은 오른쪽으로 재배치를 하고 계속하여 분할하여 정렬하는 방식.

![quicksort](https://user-images.githubusercontent.com/33976758/36380713-a094b126-15c6-11e8-9533-8d1ca8abb2c9.png)


#### 시간복잡도
O(nlog(n))

#### 소스코드
```Swift
func quickSort(_ array: [Int]) -> [Int] {

    var less = [Int]()
    var equal = [Int]()
    var greater = [Int]()

    guard array.count > 1 else { return array }

    let pivot = array[0]

    for i in array {
        if i < pivot {
            less.append(i)
        }
        if i == pivot {
            equal.append(i)
        }
        if i > pivot {
            greater.append(i)
        }
    }
    return quickSort(less) + equal + quickSort(greater)
}

func quickSort2(_ array: [Int]) -> [Int] {

    guard array.count > 1 else { return array }

    let pivot = array[array.count / 2]
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }

    return quickSort2(less) + equal + quickSort2(greater)
}
```
