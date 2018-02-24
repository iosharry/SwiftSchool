# MVC 패턴


##### 디렉터리 구조

`Util` - 유틸리티, 3rd

`Resource` - 이미지파일, 폰트 파일 등등

`Model` - 데이터 다루는 내용

`View` - 스토리보드 관련 내용

`Controller` - 전체 제어


##### Model 예시
```Swift
class Person {
  // 사용할 변수 선언
  // 되도록 외부에서 참조될 수 없는 private로 선언
  private var _firstName: String!
  private var _lastName: String!

  var firstName: String {
    get {
      return _firstName
    }
    set {
      _firstName = newValue
    }
  }

  var lastName: String {
    return _lastName
  }

  init(first: String, last: String) {
    self._firstName = first
    self._lastName = last
  }

  // 데이터 다루는 내용은 전부 Model에서 처리
  var fullName: String {
    return "\(_firstName) \(_lastName)"
  }
}
```

##### View 예시
```Swift
class RoundedImageView: UIImageView {
  override func awakeFromNib() {
    self.layer.cornerRadius = 10.0
  }
}
```

##### Controller 예시
```Swift
class ViewController: UIViewController {

  @IBOutlet weak var renameField: UITextField!
  @IBOutlet weak var fullName: UILabel!

  let person = Person(first:"gwangyong", last:"lee")

  override func videDidLoad(){
    super.viewDidLoad()

    fullName.text = person.fullName
  }

  @IBAction func btnPressed(sender:AnyObject){
    if let txt = renameField.text{
      person.firstName = textfullName.text = person.fullName
    }
  }
}
```
