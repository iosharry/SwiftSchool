# 트리(Tree)
트리는 프로그래밍에서 일상적으로 이루어지는 데이터 검색, 삽입, 삭제 등의 작업을 신속하게 처리할 수 있어 현재 개발자들 사이에서 널리 사용되고 있는 훌룡한 방법입니다.

##### 정의와 주요 속성
트리는 노드의 집합입니다. 각각의 노드는 키 값, 자식 노드 집합, 부모 노드 링크등을 포함하고 있는 데이터 구조입니다.

여러 노드 중 부모 노드를 지니지 않은 유일한 노드는 트리의 루트 노드뿐입니다.

트리는 나름의 계층을 이루고 있는 데이터 구조를 나타내며, 트리의 최상위 노드인 루트 노드와 그 아래로 뻗어나가는 자식 노드로 구성됩니다.

##### 규칙
각 노드는 한 번 이상 참조될 수 없고, 자식 노드가 다시 루트 노드로 되돌아갈 수 없으며, 순환 구조를 포함할 수 없습니다.


##### 트리 데이터 구조에서 사용하는 용어 리스트

![](https://user-images.githubusercontent.com/33976758/37328695-75703cc6-26de-11e8-9523-c44b70b3ff4e.png)

`루트(Root)` : 트리의 최상위, 부모 노드를 지니지 않은 유일한 노드

`노드(Node)` : 자식 노드와 부모 노드에 대한 참조 데이터, 그리고 값을 지닌 데이터 구조. 만일 어떤 노드가 부모 노드에 대한 참조 데이터가 없다면, 바로 그 노드가 트리의 루트 노드가 됩니다. 또, 어떤 노드가 자식 노드를 지니지 않았을 경우 잎사귀 노드가 됩니다.

`모서리(Edge)` : 부모 노드와 자식 노드의 연결선

`부모(Parent)` : 다른 노드와 연결돼 있으면서, 계층 구조상 특정 노드의 바로 위에 있는 노드를 가르킵니다. 모든 노드는 오직 하나의 부모 노드를 지닙니다.

`자식(Child)` : 다른 노드와 연결돼 있으면서, 계층 구조상 특정 노드의 바로 아래에 있는 노드를 가르킵니다. 모든 노드는 0개의 혹은 여러 개의 자식 노드를 지닙니다.

`형제(Sibling)` : 동일한 부모 노드에서 나온 노드를 가르킵니다.

`잎(Leaf)` : 더 이상의 자식 노드를 지니지 않은 자식 노드를 가르키며, 트리 계층 구조에서 맨 아래에 위치합니다. 잎 노드는 외부 노드로, 잎사귀 노드가 아닌 노드는 내부 노드로 부릅니다.

`서브트리(Subtree)` : 특정 노드의 모든 자손을 가르킵니다.

`노드의 높이(Height of a node)` : 하나의 노드에서 가장 멀리 떨어져 있는 잎사귀 노드에 이르는 모서리 수를 가르킵니다. 루트 노드밖에 없는 트리의 노드 높이는 0

`트리의 높이(Height of a tree)` : 루트 노드에서 잰 높이

`깊이(Depth)` : 루트와 노드를 연결하는 모서리의 수

`레벨(Level)` : 어떤 노드의 레벨이란 깊이 + 1을 의미

`트리 여정(Tree traversal)` :  트리의 모든 노드를 한 번씩 다녀오는 과정

##### 예제소스
```Swift
public class TreeNode<T> {
  public var value: T

  public weak var parent: TreeNode?
  public var children = [TreeNode<T>]()

  public init(value: T) {
    self.value = value
  }

  public func addChild(_ node: TreeNode<T>) {
    children.append(node)
    node.parent = self
  }
}
```
추가 메소드
```Swift
extension TreeNode: CustomStringConvertible {
  public var description: String {
    var s = "\(value)"

    if !children.isEmpty {
      s += "{" + children.map { $0.description }.joined(separator: ", ") + "}"
    }

    return s
  }
}
```

노드 추가 예제
```Swift
let tree = TreeNode<String>(value: "beverages")

let hotNode = TreeNode<String>(value: "hot")
let coldNode = TreeNode<String>(value: "cold")

let teaNode = TreeNode<String>(value: "tea")
let coffeeNode = TreeNode<String>(value: "coffee")
let chocolateNode = TreeNode<String>(value: "cocoa")

let blackTeaNode = TreeNode<String>(value: "black")
let greenTeaNode = TreeNode<String>(value: "green")
let chaiTeaNode = TreeNode<String>(value: "chai")

let sodaNode = TreeNode<String>(value: "soda")
let milkNode = TreeNode<String>(value: "milk")

let gingerAleNode = TreeNode<String>(value: "ginger ale")
let bitterLemonNode = TreeNode<String>(value: "bitter lemon")

tree.addChild(hotNode)
tree.addChild(coldNode)

hotNode.addChild(teaNode)
hotNode.addChild(coffeeNode)
hotNode.addChild(chocolateNode)

coldNode.addChild(sodaNode)
coldNode.addChild(milkNode)

teaNode.addChild(blackTeaNode)
teaNode.addChild(greenTeaNode)
teaNode.addChild(chaiTeaNode)

sodaNode.addChild(gingerAleNode)
sodaNode.addChild(bitterLemonNode)

// 출력 값
// beverages {hot {tea {black, green, chai}, coffee, cocoa}, cold {soda {ginger ale, bitter lemon}, milk}}
```

![](https://user-images.githubusercontent.com/33976758/37328797-c8bdcb5a-26de-11e8-9147-cc2d63a596ee.png)

```Swift
teaNode.parent          // hot
teaNode.parent!.parent  // root
```

다음은 TreeNode클래스를 사용하여 트리에 특정 값이 들어 있는지 판별하는 소스입니다.
```Swift
extension TreeNode where T: Equatable {
  func search(_ value: T) -> TreeNode? {
    if value == self.value {
      return self
    }
    // 일치하는 값이 없다면 children값을 체크합니다 -> 재귀
    for child in children {
      if let found = child.search(value) {
        return found
      }
    }
    return nil
  }
}

// 사용
tree.search("cocoa")  // returns "cocoa"
tree.search("chai")   // returns "chai"
tree.search("bubbly") // nil
```
참고 Github [Link](https://github.com/raywenderlich/swift-algorithm-club)
