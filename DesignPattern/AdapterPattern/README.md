# 어댑터 패턴(Adapter Pattern)
한 클래스의 인터페이스를 사용자가 원하는 다른 인터페이스에 맞게 변환시켜주는 패턴.

인터페이스의 호환 문제로 함께 쓸 수 없는 클래스를 연결해 사용할 수 있도록 해주는 역할을 함.

#### 구조
`클래스 어댑터` 와 `객체 어댑터` 두 가지 종류가 있다.

클래스 어댑터
  - Adapter가 Target타입과 동시에 Adaptee 타입이어야 하므로 다중 상속이 가능한 경우에만 가능.

  - Adaptee 전체를 다시 구현하지 않아도 된다는 장점이 있으며 Adaptee의 행동을 오버라이드 가능.

객체 어댑터

  - 클래스 어댑터와 비교해 Adapter와 Adaptee의 관계가 'is a(상속)' 관계에서 'has a(포함)'관계로 변경되었다. 이런 경우에는 Adapter에서 Adaptee 객체의 참조를 가지고 있어야 한다.

#### 동작 개념

  - 클라이언트에서 타겟 인터페이스를 사용하여 메소드를 호출함으로써 어댑터에 요청 한다.

  - 어댑터에서는 어댑티 인터페이스를 사용하여 그 요청을 어댑티에 대한 메소드 호출로 변환한다.

  - 클라이언트는 호출 결과를 받긴 하지만 중간에 어댑티가 있는지는 알지 못한다.

#### 사용 시기

  - 기존 클래스의 인터페이스가 우리가 필요한 것과 일치하지 않을 때

  - 인터페이스가 호환되지 않는 다른 클래스들과 함께 사용할 수 있는 재사용 가능한 클래스를 원할 때

  - 어떤 클래스의 여러 서브 클래스들을 다른 클래스의 인터페이스와 맞추어 재사용하고 싶을 때 각 서브 클래스에서 어댑터 클래스를 따로 인터페이스하는 것은 비효율적.
  이 때 부모클래스와 인터페이스하는 객체 어댑터를 사용.


#### 예제소스

기존에 ALib 라는 클래스를 사용. BLib이라는 클래스로 대체해야 할 상황.

```Swift
class ALib {
  func printPhoto(_ fileName: String) { }
  func printPhotoList(_ listName: [String]) { }
  func deletePhoto(_ fileName: String) { }
  func addPhoto(_ fileName: String) { }
}

class BLib {
  func printPhoto(_ fileName: String) { }
  func deletePhoto(_ fileName: String) { }
  func addPhoto(_ fileName: String) { }
}
```

```Swift
let photoList: [String] = ["a.jpg", "b.jpg"]

// 기존
let a_lib = ALib()

a_lib.printPhotoList(photoList)
a_lib.printPhoto("a.jpg")
a_lib.deletePhoto("a.jpg")
a_lib.addPhoto("c.jpg")

//photoList가 없어서 대신할 수 있는 기능 구현
let b_lib = BLib()

for photo in photoList {
  b_lib.printPhoto(photo)
}
```

객체 어댑터 패턴 적용
```Swift
// 추상 클래스에 해당하는 프로토콜 작성.
protocol PhotoLib {
  func printPhoto(_ fileName: String) { }
  func printPhotoList(_ listName: [String]) { }
  func deletePhoto(_ fileName: String) { }
  func addPhoto(_ fileName: String) { }
}
```

어댑터를 생성하고 사용할 어댑티를 호출하는 방식 구현
```Swift
// BLib를 따르는 어댑터
class PhotoAdapter: PhotoLib {
  let lib: BLib

  init(_ lib: BLib) {
    self.lib = lib
  }

  func printPhoto(_ fileName : String) {
    lib.printPhoto(fileName)
  }

  func printPhotoList(_ listName: [String]) {
    for photo in listName {
      self.lib.printPhoto(photo)
    }
  }

  func deletePhoto(_ fileName: String) {
    lib.deletePhoto(fileName)
  }

  func addPhoto(_ fileName: String) {
    lib.addPhoto(fileName)
  }
}
```

호출 할 때는 처음 생성시에만 결정해주면 동일한 함수 형태로 사용할 수 있다.
```Swift
let photoList = ["a.jpg", "b.jpg"]

let lib = BLib()  // 여기서 ALib를 사용할 지 BLib를 사용할 지 정한다.

let adapter = PhotoAdapter(lib)
adapter.printPhotoList(photoList)
adapter.printPhoto("a.jpg")
adapter.deletePhoto("a.jpg")
adapter.addPhoto("c.jpg")
```

BLib에서 다시 ALib로 사용하고자 할 때
```Swift
class PhotoAdapter: PhotoLib {
  let lib: ALib // 수정

  init(_ lib: ALib) { // 수정
    self.lib = lib
  }

  // ...

  func printPhotoList(_ listName: [String]) {
    lib.printPhotoList(listName)  // 수정
  }
}
```

다른 형태의 구현

델리게이트 패턴으로 어댑터 패턴을 대신해 사용할 수 있다.(Swift는 클로저)
클로저를 활용하면 어댑터 클래스내에 어댑티 객체를 가지고 있을 필요가 없다.
호출할 때 이미 어떤 객체의 함수를 호출할 지 결정할 수 있기 때문.
```Swift
// ALib 호출 시
adapter.printPhotoList { lib.printPhotoList(photoList) }

// BLib 호출 시
adapter.printPhotoList {
  for photo in photoList {
    lib.printPhoto(photo)
  }
}
```
참고 블로그 [Link](http://blog.naver.com/PostView.nhn?blogId=itperson&logNo=220935604923&categoryNo=92&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=1&from=postList&userTopListOpen=true&userTopListCount=10&userTopListManageOpen=false&userTopListCurrentPage=1)
