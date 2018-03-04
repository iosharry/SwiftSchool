# 너비 우선 탐색(Breadth-First-Search)
그래프의 아래로 깊이(이웃의 이웃들 속으로) 들어가기 전에, 동일 레벨 혹은 이웃 노드를 방문하는 방법에 초점을 맞춘 순회 기법이다.

이런 기법의 또 다른 특징은 각각의 노드를 단 한 번만 방문한다는 것이다.

BFS를 활용하려면 다음과 같은 정보를 포함하는 데이터 구조가 필요하다.

- 노드를 식별하기 위한 값(예를 들어, A/B/C/D 등과 같은 노드 이름)
- 연결 노드의 목록 또는 맥락에 따라 연결될 수 있는 자식, 이웃 등
- 특정 노드에 대한 방문 여부 표시, BFS는 각각의 노드를 단 한번만 방문해야 한다는 점을 기억한다.

#### 예제소스
BFS순회를 위한 그래프 노드를 구현한다.

그리고 init메소드와 노드를 연결하기 위한 addNeighbor 메소드를 추가.
```Swift
public class BFSNode<T> {
  // Value, 방문 상태, 참조값 변수 선언
  public var value: T
  public var neighbors: [BFSNode]
  public var visited: Bool

  // 초기화
  public init(value: T, neighbors: [BFSNode], visited: Bool) {
    self.value = value
    self.neighbors = neighbors
    self.visited = visited
  }

  // 예제를 위한 도우미 메소드
  public func addNeighbor(node: BFSNode) {
    self.neighbors.append(node)
    node.neighbors.append(self)
  }
}
```

큐를 구현하는 방법 대신 동일한 기능을 수행할 수 있는 보통의 배열을 이용해서 구현한다.
```Swift
public static func breadthFirstSearch(first: BFSNode) {
  // 큐 초기화
  var queue:[BFSNode] = []

  // 루트 노드에서 시작
  queue.append(first)

  // 큐에서 노드 방문을 시작
  while queue.isEmpty == false {
    if let node = queue.first {
      // 현재 노드의 값을 출력하고 방문 표식 남기기
      print(node.value)
      node.visited = true

      // 큐에 아직 방문하지 않은 이웃을 추가
      for neighbor in node.neighbors {
        if neighbor.visited == false {
          queue.append(neighbor)
        }
      }

      // 이미 처리한 노드는 삭제하고, 큐의 나머지 요소에 대한 처리 지속
      queue.removeFirst()
    }
  }
}
```

이제 우리가 원하는 순서대로 각각의 노드를 방문하기 위해 큐를 사용한다.
하나의 노드를 처리한 후, 그래프 하단으로 이동하기 전에 그 이웃에 있는 모든 노드를 큐에 집어넣고, 하나씩 방문해 나간다.
```Swift
let nodeA = BFSNode(value: "A", neighbors: [], visited: false)
let nodeB = BFSNode(value: "B", neighbors: [], visited: false)
let nodeC = BFSNode(value: "C", neighbors: [], visited: false)
let nodeD = BFSNode(value: "D", neighbors: [], visited: false)
let nodeE = BFSNode(value: "E", neighbors: [], visited: false)
let nodeF = BFSNode(value: "F", neighbors: [], visited: false)

nodeA.addNeighbor(node: nodeB)
nodeC.addNeighbor(node: nodeB)
nodeD.addNeighbor(node: nodeB)
nodeE.addNeighbor(node: nodeB)
nodeF.addNeighbor(node: nodeD)
```

노드 A부터 BFS메소드 실행.
```Swift
BFSNode.breadthFirstSearch(first: nodeA)

// 출력 내용
// A
// B
// C
// D
// E
// F
```

[참고 자료 - Swift Data Structure and Algorithms](http://acornpub.co.kr/book/swift-structure-algorithms)
