# 연결 리스트
각 노드가 데이터와 포인터를 가지고 한 줄로 연결되어 있는 방식으로 데이터를 저장하는 자료구조.

연결 리스트의 요소(노드)는 메모리에서 별개의 객체로서 링크를 통해 연결.

##### 성능
  - O(n) 시간이 걸리므로 배열보다 느리다.
  - 연결 리스트에 있는 많은 작업들을 배열과 같이 많은 양의 메모리를 복사하지 않고 몇 가지 포인터만 변경하면 된다.

  - O(n)인 이유는 리스트에서 노드2에 접근하기 위해 list[2]와 같이 간단히 쓸 수 없다는 것이다. 해당 노드에 대한 참조가 없는 경우 head에서 시작하여 다음 포인터를 따라 해당 노드로 이동해야 한다.

  - 노드에 대한 참조가 있으면 삽입과 삭제 같은 작업이 빠르다.(찾는 것이 느리다)즉, 연결리스트를 처리할 때는 가능하면 앞에 새로운 항목을 추가해야한다.


##### 단일 연결 리스트 vs 이중 연결 리스트
단일 연결 리스트는 이전 포인터를 모두 저장할 필요가 없으므로 이중 연결 리스트보다 약간 적은 메모리를 사용한다.

그러나 이전 노드를 찾아야 하는 경우 리스트의 heap부터 시작하여 올바른 노드에 도달할 때까지 전체 목록을 반복해야 한다.

##### 사용 시기
배열을 사용하면 메모리의 다른 모든 요소를 이동해야 하기 때문에 큐 앞쪽에서 요소를 제거하는 속도가 느리다.

그러나 연결 리스트를 사용하면 heap이 두 번째 요소를 가리키도록 변경만 하면 되므로 속도가 훨씬 빠르다.


##### 예제소스
노드 타입, 연결리스트 정의
```Swift
public class LinkedListNode<T> {

  var value: T
  var next: LinkedListNode?
  weak var previous: LinkedListNode?

  public init(value: T) {
    self.value = value
  }
}


public class LinkedList<T> {
  public typealias Node = LinkedListNode<T>

  private var head: Node?

  public var isEmpty: Bool {
    return head == nil
  }

  public var first: Node? {
    return head
  }
}

let list = LinkedList<String>()
list.isEmpty // true
list.first   // nil
```

마지막 노드에 속성 추가
```Swift
public var last: Node? {
  // head 옵셔널 해제
  // node를 변수로 선언했기 때문에 루프 내에서 변경할 수 있음.
  guard var node = head else {
    return nil
  }
  // node.next가 nil일 때 까지 반복
  // 현재 리스트에는 노드가 없기 때문에 nil만 리턴한다.
  while let next = node.next {
    node = next
  }

  return node
}
```

목록 끝에 새로운 노드를 추가하는 메소드



```Swift
public func append(value: T) {
  let newNode = Node(value: value)

  if let lastNode = last {
    newNode.previous = lastNode
    lastNode.next = newNode
  }
  else {
    head = newNode
  }
}
```
새로운 노드 객체를 만들고 다음 last 속성을 사용하여 마지막 노드를 요청.
노드가 존재하지 않을 때, 리스트는 빈 상태이기 때문에 head가 새로운 노드를 가리킨다.
유효한 노드 객체를 찾았다면 previous포인터와 next포인터를 연결하여 새로운 노드를 체인에 포함한다.
많은 연결 리스트의 코드에는 이런 포인터 조작이 포함된다.


첫 번째 노드 추가
```Swift
list.append("Hello")
list.isEmpty  // false
list.first!.value // "Hello"
list.last!.value  // "Hello"

	         +---------+
	head --->|         |---> nil
	         | "Hello" |
	 nil <---|         |
	         +---------+
```

두 번째 노드 추가
```Swift
list.append("World")
list.first!.value // "Hello"
list.last!.value  // "World"

          +---------+    +---------+
 head --->|         |--->|         |---> nil
          | "Hello" |    | "World" |
  nil <---|         |<---|         |
          +---------+    +---------+
```

노드 개수를 반환하는 메소드 추가
```Swift
public var count: Int {
  guard var node = head else {
    return 0
  }

  var count = 1

  while let next = node.next {
    node = next
    count += 1
  }

  return count
}
```

특정 인덱스를 찾고싶을 때
```Swift
public func node(atIndex index: Int) -> Node {
  if index == 0 {
    return head!
  }
  else {
    var node = head!.next

    for _ in 1 ..< index {
      node = node?.next

      if node == nil {
        break
      }
    }
    return node!
  }
}

list.node(atIndex: 0).value // "Hello"
list.node(atIndex: 1).value // "World"
list.node(atIndex: 2)       // error
```

Subscript 메소드
```Swift
public subscript(index: Int) -> T {
  let node = node(atIndex: index)

  return node.value
}

list[0] // "Hello"
list[1] // "World"
list[2] // error
```

모든 인덱스에 새 노드를 삽입할 수 있는 메소드
```Swift
public func insert(_ node: Node, atIndex index: Int) {
  let newNode = Node

  if index == 0 {
    newNode.next = head
    head?.previous = newNode
    head = newNode
  }
  else {
    let prev = self.node(atIndex: index - 1)
    let next = prev.next

    newNode.previous = previous
    newNode.next = prev.next
    prev.next = newNode
    next?.previous = newNode
  }
}

         +---------+     +---------+
head --->|         |---->|         |-----\\----->
         |    A    |     |    B    |
nil  <---|         |<----|         |<----\\------
         +---------+     +---------+
             [0]             [1]


         +---------+
new ---> |         |----> nil
         |    C    |
         |         |
         +---------+
```

첫 노드 앞에 새로운 노드 추가
```Swift
new.next = head
head.previous = new

        +---------+            +---------+     +---------+
new --->|         |--> head -->|         |---->|         |-----\\----->
        |    C    |            |    A    |     |    B    |
        |         |<-----------|         |<----|         |<----\\------
        +---------+            +---------+     +---------+

```

마지막으로 head를 새 노드로 바꾼다
```Swift
head = new

         +---------+    +---------+     +---------+
head --->|         |--->|         |---->|         |-----\\----->
         |    C    |    |    A    |     |    B    |
 nil <---|         |<---|         |<----|         |<----\\------
         +---------+    +---------+     +---------+
             [0]            [1]             [2]
```

주어진 인덱스가 0보다 큰 경우 이전과 다음 인덱스 노드를 가져온 후 새 노드를 그 사이에 삽입해야 한다.
```Swift
         +---------+         +---------+     +---------+    
head --->|         |---\\--->|         |---->|         |----
         |         |         |    A    |     |    B    |    
 nil <---|         |---\\<---|         |<----|         |<---
         +---------+         +---------+     +---------+    
             [0]              [index-1]        [index]      
                                  ^               ^
                                  |               |
                                 prev            next

prev = node(at: index-1)
next = prev.next
```

이제 새로운 노드를 prev와 next사이에 삽입한다.
```Swift
new.prev = prev; prev.next = new  // connect prev and new.
new.next = next; next.prev = new  // connect new and next.

         +---------+         +---------+     +---------+     +---------+
head --->|         |---\\--->|         |---->|         |---->|         |
         |         |         |    A    |     |    C    |     |    B    |
 nil <---|         |---\\<---|         |<----|         |<----|         |
         +---------+         +---------+     +---------+     +---------+
             [0]              [index-1]        [index]        [index+1]
                                  ^               ^               ^
                                  |               |               |
                                 prev            new             next
```

```Swift
list.insert("Swift", atIndex: 1)
list[0] // "Hello"
list[1] // "Swift"
list[2] // "World"
```

노드를 제거하는 메소드
```Swift
public func removeAll() {
  head = nil
}
```

개별 노드를 제거할 수 있는 메소드
이미 노드에 대한 참조가 있는 경우 remove()를 사용하면 노드를 먼저 찾기 위해 반복을 할 필요가 없기 때문에 가장 적합.
```Swift
public func remove(node: Node) -> T {
  let prev = node.previous
  let next = node.next

  if let prev = prev {
    prev.next = next
  }
  else {
    head = next
  }
  next?.previous = previous

  node.previous = nil
  node.next = nil

  return node.value
}
```

노드를 목록에서 제거하게되면 이전 노드와 다음 노드에 대한 링크가 끊어진다.
목록 전체를 다시 만들려면 이전 노드를 다음 노드에 연결해야한다.
노드가 목록의 첫 번째 노드이면 head가 다음 노드를 가르키도록 업데이트해야한다.

```Swift
list.remove(list.first!)  // "Hello"
list.count // 2
list[0] // "Swift"
list[1] // "World"
```
노드에 대한 참조가 없으면 removeLast() 또는 removeAt()를 사용할 수 있다.

```Swift
public func removeLast() -> T {
  assert(!isEmpty)

  return remove(node: last!)
}

public func removeAt(_ index: Int) -> T {
  let node = node(atIndex: index)
  assert(node != nil)

  return remove(node: node!)
}
```

모든 remove 메소드는 제거된 요소의 값도 반환한다.
```Swift
list.removeLast() // "World"
list.count  // 1
list[0] // "Swift"

list.removeAt(0)  // "Swift"
list.count  // 0
```

참고 Github [Link](https://github.com/raywenderlich/swift-algorithm-club)
