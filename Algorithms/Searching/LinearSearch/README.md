# 선형 검색(Linear Search)
선형 검색 알고리즘(linear search algorithm)은 리스트에서 찾고자 하는 값을 맨 앞에서부터 끝까지 차례대로 찾아 나가는 알고리즘입니다.
검색 방법 중 가장 단순하여 구현이 쉽고 정렬되지 않은 리스트에서도 사용할 수 있다 장점이 있습니다.

<img width="451" alt="ls" src="https://user-images.githubusercontent.com/33976758/37765457-7f3e4538-2e07-11e8-8f54-69e429ef25d1.png">

#### 시간복잡도 -> `O(n)`

정렬되어 있지 않은 데이터 배열에서 평균적으로 (n+1)/2번의 비교를 거친다. 최악의 경우 n번의 비교를 거칩니다.

#### 소스코드
```Swift
func linearSearch(_ arr: [Int], _ object: Int) -> Int? {

    for (i, obj) in arr.enumerated() where obj == object {
        return i
    }

    return nil
}

let val = [5, 2, 4, 7]
linearSearch(val, 2) // return 1
```
