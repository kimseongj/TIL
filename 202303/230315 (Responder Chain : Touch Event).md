#  Responders와 Responder Chain

- 앱들은 이벤트들을 받고, 처리하기 위해 `responder`라는 객체를 사용한다.

  - 이벤트의 종류 : 터치 이벤트, 모션 이벤트, 원격 조종 이벤트, press 이벤트 등이 있다.

- `responder`는 `UIResponder`라는 클래스의 상속된 클래스들의 인스턴스이다.

- UIApplication, UIViewController, UIView 등의 객체들 또한, responder이다.

  



### Responder의 작동원리

- 앱에서 이벤트를 받을 경우 UIKit은 자동으로 적절한 `responder` 객체로 연결해준다. 첫번 째 `responder`에..

- 이벤트가 일어나면, UIKit은 이벤트 핸들링을 위해 해당 이벤트 앱의 responder 객체들에게 보낸다.

- Responder들은 이벤트 객체들을 처리할 수도 있고, input view를 통해 커스텀 input을 받아들일 수도 있다. 
  - 예시 : 시스템 키보드는 UITextField 또는 UITextView 객체를 탭하면, 해당 뷰는 first responder가 되고, input view를 생성하여 다른 responder가 활성화됐을 때, 이 input view를 디스플레이할 수 있다.



### Responder Chain

- Respnder는 이벤트 핸들링 이외에, UIKit responder들은 처리되지 않은 이벤트를 앱의 다른 파트로 forwarding하는 일도 담당한다.

- Responder chain을 통해 responder 객체들이 이벤트를 핸들링하지 않을 경우, 해당 responder 객체를 포함하고 있는 상위 객체로 포워딩시킨다. 

- 이벤트가 처리되지 않을 경우 상위 객체로 포워딩을 계속 시키며, 마지막까지 처리되지 않을 경우, 앱이 해당 메시지를 버린다.

  - initial View -> View -> Root View -> ViewController -> Window -> Application

  <img width="394" alt="image" src="https://user-images.githubusercontent.com/88870642/225296890-cd7491f3-5dd0-47d5-afb8-f698971e2e08.png">

- 아래 그림 또한, 이벤트가 포워딩되는 과정을 보여준다. 

<img width="854" alt="image" src="https://user-images.githubusercontent.com/88870642/225297900-cc4edae3-34fc-4396-bb16-f4a66b90923b.png">





### First Responder 

- 앱에서 이벤트들을 처음으로 받는 responder 객체를 first responder라고 한다.

- First responder는 대체로 앱이 이벤트를 핸들링하기 가장 적합하다고 간주하는 responder 객체이다.

- 이벤트를 받기 위해서는, responder는 자신이 first responder가 될 수 있음을 나타내야 한다. first responder가 되려면, `UIResponder`의 서브클래스에서 `canBecomeFirstResponder` 프로퍼티를 override하여 true를 리턴해야한다.

- UIKit은 받은 이벤트의 종류에 따라서 특정 객체를 해당 이벤트의 first responder로 지정한다.

  | Event type            | First responder                    |
  | :-------------------- | :--------------------------------- |
  | Touch events          | 터치가 일어난 뷰                   |
  | Press events          | 포커스를 가진 뷰                   |
  | Shake-motion events   | UIKit이 지정한 객체 또는 직접 지정 |
  | Remote-control events | UIKit이 지정한 객체 또는 직접 지정 |
  | Editing menu messages | UIKit이 지정한 객체 또는 직접 지정 |



우리가 화면의 어느 한 지점을 탭했을 때 어떤 일이 벌어지나

- 먼저 터치된 위치를 확인
- 터치된 위치에 해당하는 하단의 뷰를 찾아냄
  - hitTest
  - FirtResponder를 찾아냄
- 가장 하단의 뷰에서부터 상위 뷰로 되돌아가 누가 터치이벤트를 처리할지 확인 (Responder Chain)

터치된 위치의 FirstResponder를 찾아내난 과정 (hitTest())

FirstResponder부터 실제 Responder를 찾아나가는 과정 



NSObject란?

Objective-C의 가장 기본적인 객체이다.

View는 UIResponder를 상속받고 있다.

UIResponder를 상속 / 채택하고 있으면 응답을 받고 처리할 수 있다.

View는 UIResponder 역할을 한다.



gestureRecocnizer와 Touch Event Handling을 같이 쓰게 되면 gestureReconizer가 우선이 되며, Touch Event Handling은 작동에 있어 완전치 못하다.

### 참고

- [Swift Document - Using Responders and The Responder Chain to Handle Events](https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/using_responders_and_the_responder_chain_to_handle_events)
- [Swift Document - Responder object](https://developer.apple.com/library/archive/documentation/General/Conceptual/Devpedia-CocoaApp/Responder.html)