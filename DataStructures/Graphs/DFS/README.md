# 깊이 우선 탐색(Depth-First-Search)
노드를 방문할 때 첫 번째(좌측) 자식을 방문하고, 다음으로 노드 자체를 방문하며, 다음 (우측) 자식을 방문합니다.

DFS 기법은 그래프 순위에 따라 방문하고 그 결과값을 가져오는 것이 주 활용 목적입니다.

#### 예제소스
DFS의 간단한 재귀 구현
```Swift
func depthFirstSearch(_ graph: Graph, source: Node) -> [String] {
  var nodesExplored = [source.label]
  source.visited = true

  for edge in source.neighbors {
    if !edge.neighbor.visited {
      nodesExplored += depthFirstSearch(graph, source: edge.neighbor)
    }
  }
  return nodesExplored
}
```
```Swift
let graph = Graph()

let nodeA = graph.addNode("a")
let nodeB = graph.addNode("b")
let nodeC = graph.addNode("c")
let nodeD = graph.addNode("d")
let nodeE = graph.addNode("e")
let nodeF = graph.addNode("f")
let nodeG = graph.addNode("g")
let nodeH = graph.addNode("h")

graph.addEdge(nodeA, neighbor: nodeB)
graph.addEdge(nodeA, neighbor: nodeC)
graph.addEdge(nodeB, neighbor: nodeD)
graph.addEdge(nodeB, neighbor: nodeE)
graph.addEdge(nodeC, neighbor: nodeF)
graph.addEdge(nodeC, neighbor: nodeG)
graph.addEdge(nodeE, neighbor: nodeH)
graph.addEdge(nodeE, neighbor: nodeF)
graph.addEdge(nodeF, neighbor: nodeG)

let nodesExplored = depthFirstSearch(graph, source: nodeA)
print(nodesExplored)
// 출력
// ["a", "b", "d", "e", "h", "f", "g", "c"]
```





[참고 자료 - Swift Data Structure and Algorithms](http://acornpub.co.kr/book/swift-structure-algorithms)
