# 추상 팩토리 패턴(Abstract Factory Pattern)
사용자가 어떤 Factory를 사용할 지 결정하기만 하면 이 Factory에서 생산되는 Product가 자연스럽게 변경될 수 있도록 만드는 것.

많은 수의 연관된 서브 클래스를 특정 그룹으로 묶어 한번에 교체할 수 있다.

##### 장점

- 특정한 팩토리 객체를 만들고 이와 연관되는 객체들을 하나의 그룹으로 묶어 쉽게 생성하고 사용할 수 있다.
- 공통으로 사용되는 인터페이스를 정의할 수 있다.
- 객체 생성과정 및 세부 구현 내용을 캡슐화 할 수 있다.
- 향후 새롭게 추가되는 기능에 대하여 유연하게 변경할 수 있다.

하지만 클래스의 수가 너무 많아져 복잡해지거나, 간단한 구조임에도 필요 이상으로 설계하는데 시간을 쓰게 될 수 있다.

##### 예제소스
```Swift
protocol Unit {
  var name: String { get set }
  func attack(target: Unit)
}

class Zergling: Unit {
  var name: String = "저글링"
  func attack(target: Unit) {
    print("저글링이 \(target.name) 공격")
  }
}

class Ultra: Unit {
  var name: String = "울트라"
  func attack(target: Unit) {
    print("울트라가 \(target.name) 공격")
  }
}

class Marin: Unit {
  var name: String ="마린"
  func attack(target: Unit) {
    print("마린이 \(target.name) 공격")
  }
}

class Medic: Unit {
  var name: String ="메딕"
  func attack(target: Unit) {
    print("메딕이 \(target.name) 치료")
  }
}

enum UnitType {
  case zergling, ultra, marin, medic
}

protocol Race {
  func createUnit(type: UnitType) -> Unit?
  func constructBuilding()
}

class Terran: Race {
  func createUnit(type: UnitType) -> Unit? {
    switch type {
    case .marin:
      return Marin()

    case .medic:
      return Medic()

    default:
      return nil
    }
  }

  func constructBuilding() {
    // ...
  }
}

class Zerg: Race {
  func createUnit(type: UnitType) -> Unit? {
    switch type {
    case .zergling:
      return Zergling()

    case .ultra:
      return Ultra()

    default:
      return nil
    }
  }

  func constructBuilding() {
    // ...
  }
}
```
팩토리만 바꿔가며 동일하게 객체를 생성하고 사용할 수 있다.

```Swift
if let myUnit = Terran().createUnit(type: .marin),
    let enemyUnit = Zerg().createUnit(type: .zergling) {
      myUnit.attack(target: enemyUnit)
      enemyUnit.attack(target: myUnit)
    }
```

참고 블로그 [Link](http://blog.naver.com/PostView.nhn?blogId=itperson&logNo=220885347418&categoryNo=92&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=1&from=postList&userTopListOpen=true&userTopListCount=10&userTopListManageOpen=false&userTopListCurrentPage=1)
