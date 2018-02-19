# 큐(Queue)

* 먼저 입력된 데이터가 먼저 출력되는 FIFO(First in First Out) 데이터 구조
* FIFO를 시각화해 보면, 슈퍼마켓에서 계산을 위해 줄을 선 구매자들과 비슷한 모습.

### 메소드
* `enqueue()` : 큐의 맨 뒤에 새로운 요소 추가

* `dequeue()` : 큐에서 첫 번째 요소를 제거한 뒤 반환

* `peek()` : 큐의 첫 번째 요소를 반한하되, 제거하지는 않음

* `clear()` : 큐를 빈 상태로 재설정

* `count()` : 큐에 있는 요소의 수를 반환

* `isEmpty()` : 큐가 비어있는 경우 true, 비어있지 않은 경우 false를 반환

* `isFull()` : 큐가 꽉 차있으면 true, 그렇지 않은 경우 false를 반환

* `capacity()` : 큐 용량을 가져오거나 설정하기 위한 read/write 프로퍼티
