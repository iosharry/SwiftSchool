# 퍼사드 패턴(Facade Pattern)
어떤 프로그램의 서로 다른 복잡한 인터페이스에 대해 단순, 통합된 인터페이스를 제공하는 객체.

복잡하고 어려운 클래스들을 쉽게 사용할 수 있도록 단순하게 통합된 객체를 만드는 것.

##### 장점

- 공통 작업에 대해 간편한 메소드를 제공하여 라이브러리를 쉽게 사용하고 이해할 수 있게 해준다.
- 퍼사드는 좋게 작성되지 않은 API의 집합을 하나의 좋게 작성된 API로 감싸준다.
- 서브 시스템이 점차 복잡해질 때, 단순화된 인터페이스 제공하기 위해 사용.
- 서브 시스템의 계층화를 하며, 그 진입 저점으로 퍼사드를 사용하고, 각 퍼사드를 통해 계층 간 교류함으로써 각 계층의 의존도를 단순화할 수 도 있다.

##### 예제소스
```Swift
class Car {
  func releaseBrakes() { }
  func pressAcclerator() { }
  func releaseAccelerator() { }
  func pressBrakes() { }
}

class Taximeter {
  func start() { }
  func stop() { }
}
```
```Swift
class TaxiDriver {
  func driveToLocation(_ des: CGPoint) {
    // ...
    let meter: Taximeter = Taximeter()
    meter.start()

    let car: Car = Car()
    car.releaseBrakes()
    car.pressAcclerator()

    // ...
    // 목적지 도착
    car.releaseAccelerator()
    car.pressBrakes()
    meter.stop()
  }
}
```

```Swift
class Passenger {
  func sayToDriver(_ des: CGPoint) {
    let driver: TaxiDriver = TaxiDriver()
    driver.driveToLocation(des)
  }
}

let me: Passenger = Passenger()
me.sayToDriver(CGPoint(x: 20, y: 20))
```

참고 블로그 [Link](http://blog.naver.com/PostView.nhn?blogId=itperson&logNo=220937841480&categoryNo=92&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=1&from=postList&userTopListOpen=true&userTopListCount=10&userTopListManageOpen=false&userTopListCurrentPage=1)
