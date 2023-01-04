## 코딩 컨벤션

- 함수명의 전달인자 괄호와 중괄호 띄어쓰기 

- 함수, 변수, 상수 이름은 CamelCase 사용하기 
- 변수명 모호하게 작성하지 않기
- 부호, 등호 양쪽으로 띄어써주기 
- 함수에서 return 사용 시 줄바꾸기

- 맥락상 의미가 달라지면 줄바꾸기

- 함수 매개변수 한줄 이상 넘어갈깨 ^^^^

```swift
func decideWinner(userHand: ScissorsRockPaper, computerHand: ScissorsRockPaper) -> String {
}

let winner = decideWinner(userHand: userHand, computerHand: computerHand)
```



```swift
func decideWinner(_ userHand: ScissorsRockPaper, _ computerHand: ScissorsRockPaper) -> String {
}

let winner = decideWinner(userHand, computerHand)
```

## switch와 if의 차이

### if

- If else의 경우 Bool 결과값을 통해 그 결과가 참일 경우 if문 내부를 실행한다.
- else문이 필수적이지 않다.

### switch

- switch는 미리 정해둔 여러 값의 일치여부에 따라 case문을 실행한다.
- default값이 필수적으로 들어가야 한다.

### 결론

- 조건문이 전제를 모두 포함하느냐 안하느냐의 차이가 있고, switch문이 모든 전제를 포함해서 작성해야하며, if문은 그렇지 않습니다!



`else-if`를 반복적으로 사용할 경우, 서로 다른 변수에 대한 조건이라면 합리적이지만 모두 같은 변수에 대한 조건이라면 `switch`문을 사용하는 것이 효과적일 수 있습니다 😃