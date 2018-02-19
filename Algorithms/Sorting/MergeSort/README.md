# 병합 정렬(Merge Sort)
전체 원소를 하나의 단위로 분할한 후 분할한 원소를 다시 병합하는 정렬 방식.

![mergesort](https://user-images.githubusercontent.com/33976758/36379270-4c53c8cc-15c1-11e8-9eb4-7574415e3465.gif)

#### 시간복잡도
O(nlog(n))


#### 소스코드
```Swift
func mergeSort(_ list: [Int]) -> [Int] {

    if list.count <= 1 { return list }

    let mid = list.count / 2
    let leftList = Array(list[0..<mid])
    let rightList = Array(list[mid..<list.count])

    return merge(mergeSort(leftList), mergeSort(rightList))
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {

    var result = [Int]()
    var left = left
    var right = right

    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            result.append(left.removeFirst())
        } else {
            result.append(right.removeFirst())
        }
    }

    return result + left + right
}
```
