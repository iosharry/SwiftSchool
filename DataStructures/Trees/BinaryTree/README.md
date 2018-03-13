# 이진 트리(Binary Tree)
이진 트리는 각 노드가 최대 두 개의 노드만을 지닐 수 있는 트리 구조입니다.
이런 속성은 이진 트리의 모든 노드가 일정한 수의 자식 노드만을 지닌다는 점을 확신할 수 있게 해줍니다.

<img src="https://user-images.githubusercontent.com/33976758/37338061-9f650bb8-26f9-11e8-8fcd-1b981e3a961a.png" width="400" height="240">

### 규칙
  - 키 데이터 값을 포함한 컨테이너
  - 좌, 우측 자식 노드에 대한 두 개의 참조값(references)
  - 부모 노드에 대한 참조값(references)

### 예제소스
<img src="https://user-images.githubusercontent.com/33976758/37338068-a4f9da90-26f9-11e8-858d-5760b20ddb01.png" width="400" height="200">

```Swift
// indirect : 열거형의 연관값은 간접적으로 지정되어 컴파일러가 재귀적인 데이터 구조를 적절하게 만들 수 있도록 해줍니다.
public indirect enum BinaryTree<T> {
  case node(BinaryTree<T>, T, BinaryTree<T>)
  case empty
}

// leaf nodes
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)

// intermediate nodes on the left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", Aminus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3andB)

// root node
let tree = BinaryTree.node(timesLeft, "+", timesRight)
```

출력을 위한 추가 메소드
```Swift
extension BinaryTree: CustomStringConvertible {
  public var description: String {
    swtich self {
      case let .node(left, value, right):
        return "value: \(value), left = [\(left.description), right = [\(right.description)]"
      case .empty:
        return ""
    }
  }
}

// 출력
/*
value: +,
	left = [value: *,
		left = [value: 5, left = [], right = []],
		right = [value: -,
			left = [value: a, left = [], right = []],
			right = [value: 10, left = [], right = []]]],
	right = [value: *,
		left = [value: -,
			left = [],
			right = [value: 4, left = [], right = []]],
		right = [value: /,
			left = [value: 3, left = [], right = []],
			right = [value: b, left = [], right = []]]]
*/
```

트리의 노드 수 계산
```Swift
public var count: Int {
  switch self {
    case let .node(left, _, right):
      return left.count + 1 + right.count
    case .empty:
      return 0      
  }
}
// 위 트리 노드 수 = 12
```

참고 Github [Link](https://github.com/raywenderlich/swift-algorithm-club)
