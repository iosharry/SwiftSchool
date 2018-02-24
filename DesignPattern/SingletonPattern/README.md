# 싱글톤 패턴
단 하나의 인스턴스를 만들어 이를 여러 곳에서 쉽게 액세스 할 수 있게 하는 것

주로 단 하나의 인스턴스로만 관리할 상황에서 사용한다.

##### 예제소스
```Swift
// ex1 -
class Person {
  static let sharedInstance = Person()

  // 외부에서 인스턴스를 직접 생성하지 못하도록 하기 위해 private로 선언
  private init() {}
}

// ex2 - 초기 설정할 내용이 있을 때
class Person {
  static let sharedInstance: Person = {
    let instance = Person()
    // setup code ..
    return instance
  }()

  private init() {}
}
```

```Swift
let instance: Person = Person.sharedInstance // O
let instance = Person() // X
```
