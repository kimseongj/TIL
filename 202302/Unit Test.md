

## Unit Test

### 정의

테스트를 작성하면 코드의 안정성을 높이고, 유지 보수에 유리해지고, 스펙을 문서화할 수도 있다.  더 깔끔한 코드 작성 가능



### Unit Test의 FIRST 원칙

- Fast

​	테스트가 빠르게 동작되어야 한다. 테스트 코드는 빠르게 확인하고, 수정하고 반영하는 데에 큰 의미가 있다.

- Independent/ Isolated

​	각각의 테스트는 서로 독립적이다. 각 테스트들은 서로에게 영향을 주면 안된다. 

​	만약 다른 코드와 의존성이 높으면 통제된 상황에서 테스트를 진행하기 어렵고, 테스트가 실패되었을 경우 그 원인이 불분명한 경우가 발생한다.

- Repeatable

​	모든 환경을 통제하였을 때, 항상 예상한 결과대로 테스트가 진행되어야 한다. 통제가 어려운 부분에 대해서는 테스트를 위한 객체를 만들어주는 방법을 선택하기도 한다.

- self-Validating

  테스트는 Bool을 이용해서 성공과 실패를 스스로 검증해야 한다. 

- Timely

​		실제 코드를 구현하기 직전에 구현해야 한다. 





![스크린샷 2023-01-20 오후 12 02 40](https://user-images.githubusercontent.com/88870642/213609302-883f2a7c-fd9d-4e60-9805-3befc7a417c0.png)



![스크린샷 2023-01-20 오후 12 02 52](https://user-images.githubusercontent.com/88870642/213609347-8f9ad8bb-9fc1-45fa-8cb6-228f5aa9c40c.png)



info가 없는 이유 : Xcode 13 버전 이후부터는 Target세팅에 포함되어 있어 없다.



```swift
import XCTest
// XCTest: 유닛 테스트, 퍼포먼스 테스트, UI 테스트를 만들고 실행하는 프레임워크이다.
@testable import UnitTestSample
// @testable은 Unit Test에서 실제 앱 타깃에 있는 코드들에 접근하기 위한 키워드, UnitTestSample이라는 타깃에 있는 코드를 작성하기 위해서 필요한 코드

final class StrangeCalculatorTests: XCTestCase {

    var sut: StrangeCalculator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = StrangeCalculator()
    }

    override func tearDownWithError() throws {
        try super.setUpWithError()
        sut = nil
    }

    //MARK: - addNumbers
    func test_addNumbers호출시_3_7_23을전달했을때_33을반환하는지() {
        
        // given
        let input = [3,7,23]
        
        // when
        let result = sut.addNumbers(of: input)
        
        // then
        XCTAssertEqual(result, 33)
    }
}
```



#### XCTest

유닛 테스트, 퍼포먼스 테스트, UI 테스트를 만들고 실행하는 프레임워크이다.

#### @testable

 Unit Test에서 실제 앱 타깃에 있는 코드들에 접근하기 위한 키워드, UnitTestSample이라는 타깃에 있는 코드를 작성하기 위해서 필요한 코드



#### setUpWithError()

각각의 test case가 실행되기 전마다 호출되어 각 테스트가 모두 같은 상태와 조건에서 실행될 수 있도록 만들어 줄 수 있는 메서드



#### tearDownWithError()

tearDownWithError()는 각각의 test 실행이 끝난 후 호출되는 메서드로, setUpWithError()에서 설정한 값들을 해제할 때 사용된다. 



![스크린샷 2023-01-20 오후 1 20 42](https://user-images.githubusercontent.com/88870642/213616691-a6fe27cb-e9ab-43d4-827c-a80da8d1c25b.png)



#### 코드를 given / when / then으로 나누어 작성하는 이유

- BDD(Behavior Driven Development)라는 테스트 방식에서 가져온 것

- BDD는 시나리오를 설정하여 예상대로 결과가 나타나는지를 확인하는 방법론이다. 어떤 상황이 주어지고(given), 어떤 코드를 실행하고(when), 테스트 결과를 확인하는(then)단계로 구분하여 테스트의 흐름을 보다 쉽게 파악할 수 있다.

 		- given 단계 : 예정된 행위(behavior)를 하기 전에 조건 등을 설정한다.

​	     - when 단계 : 예정된 행위를 한다.

 		- then 단계 : 예정된 행위로 인해 예상한 결과를 도출하는지 확인한다.



#### SUT

System Under Test, 즉 테스트를 할 타입



#### super를 호출해 주는 이유

 StrangeCalculatorTests가 XCTestCase을 상속받았고, 메서드들을 override 해서 사용해 주고 있기 때문이다.



#### 테스트하는 방법 

아래 다이아몬드를 클릭해서 확인 가능하다.

![스크린샷 2023-01-22 오후 6 22 49](https://user-images.githubusercontent.com/88870642/213908764-b6293ce2-c6a3-4ced-a2e7-21eca8685d4a.png)







#### Code Coverage

테스트의 가치를 측정해주는 툴이다. 실제 앱 코드에서 어느 정도의 테스트가 진행되었는지 알 수 있다.

Code Coverage를 통해 

- 실제 테스트에서 어떤 코드가 실행되었는지
- 정확성, 성능에 대해 얼마나 충분히 테스트가 이루어졌는지
- 테스트가 포함하고 있지 않는 코드는 무엇인지 



Command + U 테스트 실행 



경계값을 테스트하는 것이 좋음 edge case 





TDD (Test-Driven-Development)

- Timely 부분에 해당된다. 코드가 작성되기 직전에 테스트를 해야 한다.
- 테스트 주도 개발
- 테스트가 개발을 주도하는 개발 방법론
- 테스트는 코드 작성 전에 작성하는 것이 이상적이다
- 장점 
  - 테스트하기 어려울 수 있는 코드일 수 있기 때문에, TDD를 하면서 코딩을 작성하면, 유지보수, 재사용성에 용이하다.
  - 큰 단위의 문제를 작은 단위로 나누게 된다.
  - 지속적인 피드백을 통해 목표를 개선할 수 있다.
- 단점
  - 시간이 오래 걸린다.

