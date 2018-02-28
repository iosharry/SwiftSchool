# 스트래티지 패턴(Strategy Pattern)
알고리즘들의 그룹을 정의하고, 각각을 캡슐화하여 교체 가능하게 만들어 그것을 사용하는 클라이언트와 독립적으로 변경될 수 있게 하는 패턴.

#### 사용 시기

- 클래스에서 여러 가지 행동을 정의하기 위해 자신의 오퍼레이션 안에 여러 개의 조건문을 사용할 때 조건 분기문들을 스트래티지 클래스로 옮길 수 있다.

- 서로 다른 변형 알고리즘들이 필요할 때

- 복잡하면 자신의 고유 알고리즘 성격이 강한 데이터 구조를 클라이언트에 노출시키지 않아야 할 때

#### 예제소스

공통 인터페이스 정의

```Swift
protocol Strategy {
  func doOperation(_ num1: Int, _ num2: Int) -> Int
}
```

각 클래스의 세부 내용 구현
```Swift
class OperationAdd: Strategy {
  func doOperation(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2
  }
}

class OperationSubtract: Strategy {
  func doOperation(_ num1: Int, _ num2: Int) -> Int {
    return num1 - num2
  }
}

class OperationMultiply: Strategy {
  func doOperation(_ num1: Int, _ num2: Int) -> Int {
    return num1 * num2
  }
}
```

호출을 담당하는 객체 Context
```Swift
class Context {
  let strategy: Strategy

  init(strategy: Strategy) {
    self.strategy = strategy
  }

  func executeStrtegy(_ num1: Int, _ num2: Int) -> Int {
    return strategy.doOperation(num1, num2)
  }
}
```

사용
```Swift
let context = Context(strategy: OperationAdd())
print(context.executeStrtegy(10, 20)) // 30

context = Context(strategy: OperationMultiply())
print(context.executeStrtegy(10, 20)) // 200
```
참고 블로그 [Link](http://blog.naver.com/PostView.nhn?blogId=itperson&logNo=220938127880&categoryNo=92&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=&from=postList&userTopListOpen=true&userTopListCount=10&userTopListManageOpen=false&userTopListCurrentPage=1)
