## MVVM



### Model

Model은 데이터 구조를 정의하고 ViewModel에게 결과를 알려준다. Model과 View가 연결되지 않는다.

### View

View는 ViewController에서 작성되며, ViewModel이 업데이트 요청한 데이터를 보여준다.

### ViewModel

ViewModel은 사용자의 상호작용을 View가 보내주면 그에 맞는 이벤트를 처리하고 Model의 데이터 결과를 View에 뿌려준다.





공통으로 사용되는 Class는 어떻게 처리해주면 좋을까?