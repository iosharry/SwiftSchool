# 팩토리 메소드 패턴(Factory Method Pattern)
객체를 만들어내는 부분을 서브클래스에 위임하는 패턴.

객체를 만들어내는 공장을 만드는 패턴.

##### 장점

- 런타임 시에 정확히 어떤 클래스의 객체가 생성될지 예상할 수 없을 때
- 생성되는 객체의 클래스들을 특정 클래스의 서브 클래스들로 두고자 할 때
- 어떤 클래스에서 도우미(helper) 클래스들을 서브 클래스로 가지고 있으면서 그 서브 클래스 중 하나의 객체를 생성하여 반환하고자 할 때

##### 예제소스
```Swift
protocol Unit {
  func attack()
}

class Marin: Unit {
  func attack() {
    print("마린이 공격을 시작합니다.")
  }
}

class Ghost: Unit {
  func attack() {
    print("고스트가 공격을 시작합니다.")
  }
}

class Medic: Unit {
  func attack() {
    print("메딕이 치료를 시작합니다.")
  }
}

enum UnitType {
  case marin, ghost, medic
}

class Barraks {
  func createUnit(type: UnitType) -> Unit {
    switch type {
      case .marin: return Marin()
      case .ghost: return Ghost()
      case .medic: return Medic()
    }
  }
}
```
```Swift
let barracks = Barraks()
let unit = barracks.createUnit(type: .marin)
unit.attack() // 마린이 공격을 시작합니다.
```

참고 블로그 [Link](http://blog.naver.com/PostView.nhn?blogId=itperson&logNo=220885347418&categoryNo=92&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=1&from=postList&userTopListOpen=true&userTopListCount=10&userTopListManageOpen=false&userTopListCurrentPage=1)
