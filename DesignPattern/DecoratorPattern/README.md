# 데코레이터 패턴(Decorator Pattern)
어떤 객체의 원래 특성을 바꾸지 않고 동적으로 어떤 책임, 역할을 덧붙이는 패턴이다.

데코레이터라는 말 처럼 어떤 것에 추가적인 장식. 즉, 기능 확장이 필요할 때 사용하며 서브클래싱 대신 쓸 수 있는 유연한 패턴이다.

<img src="https://user-images.githubusercontent.com/33976758/37082431-e625f6da-222f-11e8-8a86-63a6c4c2ca9d.png" width="400" height="200">

#### 사용 시기

- 다른 객체에서 영향을 주지 않고 개별적인 객체들에게 동적으로 책임을 추가하고자 할 때

- 클래스의 정의가 감추어져 있거나 그 클래스의 서브 클래스를 만들 수 없는 경우

- 어떤 클래스의 행동을 확장하려면 많은 수의 서브 클래스가 필요할 때 대신하여 사용

#### 특징

- 기본적인 데이터에 첨가할 데이터가 다양하고 일정하지 않을 때 효율적이다.

- 원래 클래스는 그대로 보존하고 그것을 이용한 다양한 클래스를 만들어낼 수 있다.

- 객체 지향 설계 디자인 원칙 중 하나인 OCP(Open-Closed-Principle)에 부합.
  (OCP : 클래스는 확장에 대해서는 열려있어야 하지만 코드 변경에 대해서는 닫혀 있어야 한다는 뜻)

- 단, 데코레이터 패턴에 의해 자잘한 객체들이 너무 많이 추가될 수 있고, 그렇게 되면 코드가 필요 이상으로 복잡해 질 수 있으며, 원래 객체를 추적하기 힘들어질 수 있다.

#### Decorator Pattern vs Strategy Pattern

###### Decorator Pattern
외부에서 변경 / 각 노드는 변경 사항을 알지 못한다.

###### Strategy Pattern
내부에서 변경 / 각 노드는 사전 정의된 변경 방법들을 안다.

#### 익스텐션과 데코레이터 패턴
익스텐션은 Swift의 클래스 기능을 수평 확장해주는 특성으로, 데코레이터 패턴과 마찬가지로 서브 클래스를 만들지 않고 그 클래스에 새로운 행동을 추가할 수 있게 해준다.

데코레이터 패턴과 동일한 역할을 하지만 엄밀히 따지면 익스텐션은 컴파일 시점에서 정적 바인딩되며, 확장되는 클래스 인스턴스를 캡슐화하지 않는 차이가 있다.

하지만 데코레이터 패턴을 이용해 서브 클래스를 만드는 것보다 익스텐션이 훨씬 구현하기 편하고 가볍다는 장점이 있다.

#### 예제소스

예제 프로토콜 정의 (Component)

```Swift
protocol Coffee {
  func getCost() -> Double
  func getIngredients() -> String
}
```

기본 커피 타입 정의.
여기서는 아메리카노 하나만 정의했지만 다른 커피 종류도 사용 가능
(Concrete Component)
```Swift
class Americano: Coffee {
  func getCost() -> Double {
    return 1.0
  }

  func getIngredients() -> String {
    return "Americano"
  }
}
```

커피 데코레이터 정의 (Decorator)
```Swift
class CoffeeDecorator: Coffee {
  let decoratedCoffee: Coffee
  let ingredientSeparator: String = ", "

  required init(decoratedCoffee: Coffee) {
    self.decoratedCoffee = decoratedCoffee
  }

  func getCost() -> Double {
    return decoratedCoffee.getCost()
  }

  func getIngredients() -> String {
    return decoratedCoffee.getIngredients()
  }
}
```

데코레이터를 상속받아 기존 기능에 '라떼' 추가 확장(Concrete Decorator)
```Swift
class Latte: CoffeeDecorator {
  required init(decoratedCoffee: Coffee) {
    super.init(decoratedCoffee: decoratedCoffee)
  }

  override func getCost() -> Double {
    return super.getCost() + 0.2
  }

  override func getIngredients() -> String {
    return super.getIngredients() + ingredientSeparator + "Milk"
  }
}

class WhipCream: CoffeeDecorator {
  required init(decoratedCoffee: Coffee) {
    super.init(decoratedCoffee: decoratedCoffee)
  }

  override func getCost() -> Double {
    return super.getCost() + 0.3
  }

  override func getIngredients() -> String {
    return super.getIngredients() + ingredientSeparator + "WhipCream"
  }
}
```

```Swift
let coffee = Americano()
print(coffee.getCost()) // 1.0
print(coffee.getIngredients()) // Americano

let latte = Latte(decoratedCoffee: coffee)
print(latte.getCost()) // 1.2
print(latte.getIngredients()) // Americano, Milk

let whipLatte = WhipCream(decoratedCoffee: latte)
print(whipLatte.getCost()) // 1.5
print(whipLatte.getIngredients()) // Americano, Milk, WhipCream
```
참고 블로그 [Start from the beginning](http://blog.naver.com/PostView.nhn?blogId=itperson&logNo=220937946762&categoryNo=92&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=&from=postList&userTopListOpen=true&userTopListCount=10&userTopListManageOpen=false&userTopListCurrentPage=1)
