# 이진 검색(Binary Search)
이진 검색 알고리즘(binary search algorithm)은 오름차순으로 정렬된 리스트에서 특정한 값의 위치를 찾는 알고리즘입니다.
처음 중간의 값을 임의의 값으로 선택하여, 그 값과 찾고자 하는 값의 크고 작음을 비교하는 방식입니다.

배열의 요소를 빠르게 찾는 것이 목표인 알고리즘!

<img width="466" alt="bs" src="https://user-images.githubusercontent.com/33976758/37765496-995c8eac-2e07-11e8-820f-130cf1dced16.png">

#### 시간복잡도 -> `O(logN)`
탐색이 끝나는 시점에는 남은 자료의 개수가 1이 되어야 합니다.

따라서,

<img width="125" alt="big-o" src="https://user-images.githubusercontent.com/33976758/37761371-d401cf78-2dfc-11e8-9ed6-5830620d275c.png">


#### 소스코드
```Swift
func binarySearch(arr: [Int], key: Int) -> Bool {

  if arr.count == 0 { return false }

  let minIndex = 0
  let maxIndex = arr.count - 1
  let midIndex = maxIndex / 2
  let midValue = arr[midIndex]

  if key < arr[minIndex] || key > arr[maxIndex] {
    print("\(key) is not in the array")

    return false
  }

  if key > midValue {
    let slice = Array(arr[midIndex + 1...maxIndex])

    return binarySearch(arr: slice, key: key)
  }

  if key < midValue {
    let slice = Array(arr[minIndex...midIndex-1])

    return binarySearch(arr: slice, key: key)
  }

  if key == midValue {
    print("\(key) found in the array")

    return true
  }

  return false
}

let val = [ 1, 6, 11, 13, 15, 19, 22, 29, 35 ]

binarySearch(array: val, key: 11)
// 11 found in the array
```
