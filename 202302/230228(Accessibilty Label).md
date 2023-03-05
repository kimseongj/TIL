# accessibility label

Accessibility : 어떤 사람이든 쉽게 접근할 수 있게 해주는 것



## 정의

- 보이스오버 사용자들은 accessibilityLabel에 들어있는 값을 듣게 된다. 

- 그렇기 때문에 accessibilityLabel은 간결하게 식별하는 Localized된 문자열이다. 



![img](https://blog.kakaocdn.net/dn/yta4o/btq5G17P5Fy/dMS7bSWHJyI0J5f7AxBun1/img.png)

  

#### ## 올바른 방법으로 작성하기

![img](https://blog.kakaocdn.net/dn/cqOBOW/btq5KQROoeK/CBfAKze2cWoZpIgXou3QQk/img.png)

 

### - Remember to add labels

- 버튼에 label을 달아야 한다.
-  "plus_icon_" 등 언더바가 읽히지 않도록 띄어쓰기를 활용해야 한다.

 

![img](https://blog.kakaocdn.net/dn/QHV4n/btq5DaYC0h0/GK8i39kYnJncsuZviG54T1/img.png)



### - Don't Include the Element Type in the Label

- element type은 넣지 않는다.(Button, Label... etc)

- 두번째 경우와 같이 "Add"만 작성해도 알아서 추가해서 "Add Button"으로 읽어준다. 

 

![img](https://blog.kakaocdn.net/dn/srOlV/btq5FdBcGa1/W72ZJXP65kFiKenkBxAwnK/img.png)



### - Update Labels When UI Changes

- UI 변화 혹은 UI 이름 변화가 있을 때 accessibility label도 바꿔줘야 한다.



![img](https://blog.kakaocdn.net/dn/mCkvh/btq5C96xHmj/0bGRMQ1KtPBdJcw9MFwxkK/img.png)



 

### - Avoid redundancy, but provide enough context

- 동일한 기능을 하는 버튼이 여러개 있을 때 명확하게 표현해줘야 한다. 

- 아래 예시와 같이 버튼이 있을 때 "Bananas Add", "peanut Butter Add" 이런식으로 명확하게 표현해준다.



![img](https://blog.kakaocdn.net/dn/cfl3eC/btq5APmVDNe/ybsb7yfW8qMFCiUGsMK201/img.png)



![img](https://blog.kakaocdn.net/dn/8WIqc/btq5FXdNILS/fxKg4dWDdWgsSpPleDmL7k/img.png)



- 중복을 피해야한다.
- 음악앱이라면 "song"을 생략해도 알 수 있다.

![img](https://blog.kakaocdn.net/dn/XfaFa/btq5AO2EGrn/jg7SXAqM15kgFpH5S85Kqk/img.png)

 

### - Add labels to meaningful animations 

- 애니메이션에 의미가 있을 경우 label을 붙여준다.

![img](https://blog.kakaocdn.net/dn/Ccjzk/btq5J167boo/4SQDuYencShsPahR7SKrH0/img.png)



### - Avoid verbose labels.. unless you have a great reason*

- Accessibility Label의 길이가 너무 길어지지 않게 해야 한다.

![img](https://blog.kakaocdn.net/dn/dpGGXq/btq5ItJzVAd/J7o9sajQtsmhUsllaFqhJK/img.png)



## 참고

- [WWDC 2019 Writing Great Accesibility Labels](https://developer.apple.com/videos/play/wwdc2019/254/)