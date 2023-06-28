MVVM 에서 ViewModel이 비대해지면 어떻게 하는게 좋을까 ViewController를 여러개로 나누어서 사용한다. 



MVC(Model-View-Controller)

사용자 인터페이스로부터 비즈니스 로직을 분리하여 서로 영향 없이 쉽게 고칠 수 있는 애플리케이션을 만들기 위해 존재한다.

![image-20230530205102515](/Users/ksj8277/Library/Application Support/typora-user-images/image-20230530205102515.png)



Model이란?

화면과 화면을 제어하는 것을 제외한 모든 것 

- 비즈니스 로직 : 앱 전반의 매인 로직 ex) 계산기앱 - 계산로직
- 저장소 객체(네트워크 API, 로컬 저장소 등)
- 앱 자원 관리 객체(Asset, 상수, 색상 등)
- 그 외 모든 앱에서 공통적으로 사용될 만한 객체
  - 데이터 파싱
  - 기타 유틸
  - 애플 제공 키트 





MVVM에서 VM은 어떤 역할을 하나요?!

View의 요청에 따라 로직을 실행하고, Model의 변화에 따라 데이터를 처리하는 기능을 합니다.



그럼, 어떠한 단위로 나눠주는게 좋을까요?

Model값의 변화에 따라 데이터를 처리하기 때문에 ViewModel이 ViewController 하나씩 담당하는게 좋아보입니다. 

다만... 현재 저희가 구현한 것은 ViewModel이 todoSchedules, doingSchedules, doneSchedules를 가지고 있는데, 저 데이터들을 Model에서 가지고 있는게 맞는 방법일 것 같습니다. 그렇다면 Model과 ViewModel을 바인딩하고, ViewModel과 ViewController를 바인딩해주는게 맞는 걸까요..? 





Model 단위로 분리하는게 좋아보입니다.. 근데 MVVM예제들을 살펴보면 ViewController가 하나의 ViewModel을 가지고 있는 형태인것 같습니다.