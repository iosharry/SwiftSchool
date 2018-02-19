/*
 *  큐 구현
 */

import Foundation

public struct Queue<T> {
    
    private var data = [T]()
    
    // 빈 큐 구조를 정의
    public init() {}
    
    // 큐에서 첫 번째 요소를 제거하고 반환
    // 큐가 빈 상태가 아닌 경우, 첫 번째 요소의 타입은 'T'
    // 큐가 빈 상태인 경우, 'nil'을 반환
    public mutating func dequeue() -> T? {
        return data.removeFirst()
    }
    
    // 큐에서 첫 번째 요소를 제거하지 않고 반환
    public func peek() -> T? {
        return data.first
    }
    
    // 큐의 맨 뒤에 요소를 추가
    public mutating func enqueue(element:T) {
        data.append(element)
    }
    
    // 순환 버퍼를 위한 도우미 메소드 구현
    // 버퍼를 재설정해 빈 상태가 되게 함
    public mutating func clear() {
        data.removeAll()
    }
    
    // 큐에 있는 요소의 수를 반환
    public var count:Int {
        return data.count
    }
    
    // 큐의 용량을 반환
    public var capacity:Int {
        get {
            return data.capacity
        }
        set {
            data.reserveCapacity(newValue)
        }
    }
    
    // 큐가 꽉 찼는지 확인
    public func isFull() -> Bool {
        return count == data.capacity
    }
    
    // 큐가 비어 있는지 확인
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
}
