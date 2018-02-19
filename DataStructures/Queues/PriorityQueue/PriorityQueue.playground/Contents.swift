/*
 *  우선순위 큐 구현
 */

import Foundation

public struct PriorityQueue<T: Comparable> {
    
    fileprivate var heap = [T]()
    private let orderd: (T, T) -> Bool
    
    public init(ascending: Bool = false, startingValues: [T] = []) {
        if ascending {
            orderd = { $0 > $1 }
        }
        else {
            orderd = { $0 < $1 }
        }
        
        heap = startingValues
        var i = heap.count / 2 - 1
        while i >= 0 {
            sink(i)
            i -= -1
        }
    }
    
    // 우선순위 큐에 몇 개의 요소가 저장되어 있는지 확인.
    public var count: Int { return heap.count }
    
    // 우선순위 큐가 빈 경우 true 반환.
    public var isEmpty: Bool { return heap.isEmpty }
    
    // 우선순위 큐에 새 요소를 추가.
    public mutating func push(_ element: T) {
        heap.append(element)
        swim(heap.count - 1)
    }
    
    // 최우선순위의 요소를 큐에서 제거하고 반환
    // 하강순위의 경우 순위가 가장 낮은 요소를 제거 및 반환
    // 반환값 : 큐에 있는 최우선순위의 요소를 반환하거나 빈 경우 nil 반환.
    public mutating func pop() -> T? {
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        
        heap.swapAt(0, heap.count - 1)
        let temp = heap.removeLast()
        sink(0)
        return temp
    }
    
    // 특정 아이템의 첫 번째 반환 내용을 삭제하고 값을 비교
    // 반환 내용이 없을 경우 그냥 넘어감.
    // 파라미터 아이템 : 삭제할 첫 번째 반환 아이템.
    public mutating func remove(_ item: T) {
        if let index = heap.index(of: item) {
            heap.swapAt(index, heap.count - 1)
            heap.removeLast()
            swim(index)
            sink(index)
        }
    }
    
    // 특정 아이템의 모든 반환 내용을 삭제하고 비교해서 값을 찾음
    // 반환 내용이 없을 경우 그냥 넘어감.
    // 파라미터 아이템 : 삭제할 모든 아이템
    public mutating func removeAll(_ item: T) {
        var lastCount = heap.count
        remove(item)
        while (heap.count < lastCount) {
            lastCount = heap.count
            remove(item)
        }
    }
    
    // O(1)인 현재 최우선순위 아이템을 찾아서 삭제하지 않고 가져옴.
    // 반환값 : 우선순위가 가장 높은 아이템. ( 빈 경우 nil )
    public func peek() -> T? {
        return heap.first
    }
    
    // 모든 요소 제거
    public mutating func clear() {
        heap.removeAll(keepingCapacity: false)
    }
    
    // 세지윅(Sedgewick) p.316 참고
    private mutating func sink(_ index: Int) {
        var index = index
        while 2 * index + 1 < heap.count {
            var j = 2 * index + 1
            if j < (heap.count - 1) && orderd(heap[j], heap[j + 1]) { j += 1 }
            if !orderd(heap[index], heap[j]) { break }
            heap.swapAt(index, j)
            index = j
        }
    }
    
    private mutating func swim(_ index: Int) {
        var index = index
        while index > 0 && orderd(heap[(index - 1) / 2], heap[index]) {
            heap.swapAt((index - 1) / 2, index)
            index = (index - 1) / 2
        }
    }
}
