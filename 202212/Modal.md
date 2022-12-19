# Modal



## VC.present(_:animated:completion:)

ViewController를 모달 형식으로 띄우는 메서드이다

ViewController는 ModalPresentationStyle에 정의된 형식으로 ViewController를 띄운다

PresentationStyle에 의해 사이즈 조정

ModalTransitionStyle에 의해서 어떤 애니메이션으로 띄어질지 결정

커스텀을 위해서 delegate를 사용한다.



## VC.dismiss

ViewController를 화면에서 내려주는 메서드이다.



## VC.transitionDelegate

모달을 커스텀으로 만들기 위해 ViewController.modalPresentationStyle을 .custom으로 설정하고, ViewController.transitioningDelegate를 자신에게 담당시키면 된다.





## transition animator object

모달의 모든 전환은 transition animator object를 사용한다. 



## UIViewControllerAnimatedTransitioning

이 프로토콜에 있는 메서드는 애니메이션 지속시간과 어떤 애니메이션이 진행될지에 대해 정의할 수 있다.



## 참고

 https://thecosmos.tistory.com/4