StackView

axis(UIStackView)

가로(Horizontal), 세로(Vertical)

orientation(NSStackView only)

distribution(axis 방향으로)

- fill: 스택뷰 안에 여러 뷰들로 채워준다.
- fillEqually: 뷰들이 동일한 크기로 채워준다.
- fillProportionally: 뷰의 컨텐츠 비율대로 채워준다.
- equalSpacing: 간격을 동일하게 가져간다.
- equalCentering: 각각의 뷰들의 중앙을 기점으롤 동일한 간격을 가진다.

alignment(axis 반대방향으로)

- fill: 뷰를 스택뷰 크기만큼 채워준다.
- leading: leading에 정렬된다.
- top: top으로 정렬된다.
- firstBaseline:  text의 맨 윗줄을 기준으로 정렬
- center: 가운데 정렬
- trailing: trailing에 정렬
- bottom: bottom에 정렬
- lastBaseline: text의 맨 아랫줄을 기준으로 정렬



contentInset

contentInset은 컨텐츠에 상하좌우 여백을 주는 것이라고 생각하면 됩니다.

contentView의 inset이 safe area나 scrollView에서 얼마나 떨어져있는지 의미합니다.

contentOffset

contentOffset은 contentView가 위치한 point입니다. 

즉 사용자가 영역을 스크롤한 후에 있는 지점을 의미하고, 사용자가 스크롤할 때마다 값이 바뀝니다.

contentSize 

컨텐츠 뷰의 사이즈입니다.

고차함수

고차함수를 사용하면 상수 선언이 가능하다.

```swift
let oddNumber: [Int] = numbers.filter {
  $0 % 2 != 0
}
```



map

콜렉션 내부의 기존 데이터를 변형하여 새로운 콜렉션 생성



filter



reduce

컨테이너 내부의 콘텐츠를 하나로 통합 





subView 삭제하는 방법

stackView의 값의 서브뷰들을 삭제하려고 했다.

```swift
expressionStackView.subviews.map( { $0.removeFromSuperview() })
```





@llingo
안녕하세요 링고! 리뷰 받기전에 먼저 죄송하다는 말씀 전해드리겠습니다.. 코드가 매우 난잡해서 보다보면 눈이 아플거 같군요😂
이번 스텝에서 수많은 로직 구현과 예외처리를 하면서 벽을 느꼈습니다. 특히, 처음에 판을 잘못 짰는데 그 방향으로 밀어붙이니 결과는 좋지 않군요! 시간 나는대로 여러가지 방법으로 접근해보겠습니다! 무튼 리뷰 잘부탁드립니다!! 감사합니다!

-----------
## 고민했던 점
### 숫자버튼과 (.), 0, 00의 분리
>  숫자버튼과 (.), 0, 00을 모두 같은 IBAction으로 받았습니다. 

### scrollView에서 contentViewSize가 커지면 현재 계산식이 가려지는 문제점
위 문제를 해결하기 위해 아래와 같은 방법을 사용했습니다. 
- bound는 기준이 자기 자신이며, scrollView의 `contentSize.height`에서 현재 `scrollView.bounds.height`를 빼주어서 CGPoint를 지정해주었습니다. 
```swift
expressionScrollView.setContentOffset(
            CGPoint(x: 0, 
                    y: expressionScrollView.contentSize.height - expressionScrollView.bounds.height),
            animated: true)
````

- 이 때 문제점은 설정은 제대로 되었지만, 바로 적용되지 않는 오류가 발생합니다. 이를 해결하기 위해 `layoutIfNeeded()`라는 메서드를 호출했습니다.
- `layoutIfNeeded()` 함수를 사용하여, 즉각적인 화면의 변화를 나타내줍니다.
```swift
expressionScrollView.layoutIfNeeded()
```

## 조언을 얻고 싶은 점
### 로직을 구현할 때 방향성
> 간단한 로직 구현은 여차저차 잘해왔던거 같은데, 이렇게 다양한 요구사항을 맞닥뜨리고 로직을 구현하려고 하니 정말 어려움을 많이 겪었던 것 같습니다. 사람마다 다 다르겠지만, 링고의 요구사항을 풀어나갈 때 무엇을 우선시 하는지 궁금합니다!

### 해결하지 못한 점
### 소수점이 즉각적으로 나오지 않습니다😂
> `numberFormatter`를 사용하기 전에는 String형으로는 소수점이 잘적혔는데,` numberFormatter`를 적용하고 나서부터 `.`을 입력해도 바로 나오지 않습니다.

### 화면에 20자리까지만 나오게 하고 싶습니다.
> Significant, Fraction의 자리수를 제한하는 등 여러 방법으로 자리수를 제한하려 했습니다. 하지만 20자리까지 제한되지 않았습니다. (,)가 포함된 자리수가 20자리인지, 숫자들만 포함하여 20자리인지 궁금합니다!





어떻게 하면 좋은 아이디어를 떠올릴까