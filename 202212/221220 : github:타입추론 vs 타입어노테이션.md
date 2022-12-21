

# github 



### add

stage area라는 가상 공간에 add를 통해 넣어줌 



### commit

stage area에 있는 파일들만 커밋이 가능  



### Github와 Git의 관계

git은 도구 gitgub는 서비스 

깃허브에 백업을 만드는 것을 push 



### PR

정보나 권한을 가지고 있지 않은 사람이 정보나 권한을 얻기 위해 요청하는 것이다. (Pull Request)요청을 당겨달라 하는 것이다.



### revert 공부해보기 



# 타입 추론과 타입 어노테이션 

## Type annotation 

- 변수 혹은 상수를 선언할 때 그 타입을 명시적으로 선언

- 어떤 타입의 값이 저장될지 컴파일러에 직접 알려준다.

```swift
var name: String
var number: Int
var areYouSure: Bool
```



## Type Inference(타입추론)

- 변수 혹은 상수를 선언 시 타입을 명시하지 않고 값을 넣어 초기화

 - Swift 특성 중 "설계에 의한 안전성"이라는 항목에 의거해서, 타입 추론은 변수나 상수를 초기화할 때 입력된 값을 바탕으로 스스로 추론이 가능하다.



### 그러면 자동으로 타입으로 추론 해주는 타입추론이 편한 것 아닐까?

### ex 1)

```swift
var number1 = 3

var number2: Float = 3
```

- 위와 같이 Int 타입으로 지정해줄지 Float타입으로 지정해줄지 미리 정해야되는 경우가 생길 수 있기 때문에 타입 어노테이션이 필요하다.



### Ex 2)

```swift
var name = "kim"
var name2 = "a" // String인지 Character인지 확인 불가
var name3: String = "k"
```

- 문자열과 문자 모두 큰따옴표를 사용하기 때문에 구분짓기 위해서 타입 어노테이션이 필요하다.
