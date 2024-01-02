# Unit Test

테스트의 장점

- 코드의 안정성을 높인다.
- 유지보수에 유리해진다.
- 스펙을 문서화할 수도 있고, 더 깔끔한 코드를 작성할 수 있다.

## Unit Test

컴퓨터 프로그래밍에서 소스 코드의 특정 모듈이 의도된 대로 정확히 작동하는지 검증하는 절차이다. 

테스트가 가능한 코드

- 의존성이 너무 강한 메서드는 외부 코드의 영향을 매우 많이 받아 테스트하기 까다롭다.

- FIRST 원칙
    - Fast
        - 테스트는 빠르게 동작할 수 있어야 한다.
    - Independent/Isolated
        - 각각의 테스트는 서로 독립적이며 서로 의존해서는 안된다.
    - Repeatable
        - 테스트는 언제 어디서나 같은 결과가 반복되어야 한다. 즉 모든 환경을 통제하여 매번 예상한 결과대로 테스트가 진행되어야 한다.  이를 위해 통제가 어려운 부분에 대해서는 테스트를 위한 객체를 만들어주기도 한다.
    - Self-Validating
        - 테스트는 Bool을 이용하여 성공/실패에 대해서 스스로 검증이 가능해야 한다.
    - Timely
        - 이상적인 테스트는 테스트하려는 실제 코드를 구현하기 직전에 구현해야 한다. 만약 실제 코드를 구현한 후에 테스트 코드를 작성할 경우 테스트하기가 매우 까다롭거나 불가능하도록 설계가 되어있을 지도 모른다.
        - 
        
    
    ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/086698e2-767e-43bf-9c93-e470eeb58b78/b00bc461-2fcd-40e5-a966-d9742305dbf1/Untitled.png)
    
    XCTest
    
    XCTest는 유닛 테스트, 퍼포먼스 테스트, UI 테스를 실행하는 프레임워크이다.
    
    테스트에 필요한 코드들을 사용하기 위해 XCTest 프레임워크를 import해야 한다.
    
    XCTestCase
    
    테스트를 위한 클래스가 만들어져있는 것을 확인할 수 있다. 테스트 클래스가 상속하고 있는 XCTestCase는 무엇일까?
    
    XCTestCase는 추상 클래스인 XCTest의 하위 클래스로, 테스트를 작성하기 위해 상속해야 하는 가장 기본적인 클래스이다. XCTest는 테스틑를 위한 프레임워크 이름이자, 테스트에서 가장 기본이 되는 추상 클래스의 이름이기도 하다.
    
    **setUpWithError()**
    
    ```swift
    override func setUpWithError() throws { }
    ```
    
    `setUpWithError` 는 각각의 testcase가 실행되기 전마다 호출되어 각 테스트가 모두 같은 상태와 조건에서 실행될 수 있도록 만들어주는 메서드이다.
    
    **tearDownWithError()**
    
    ```swift
    override func tearDownWithError() throws { }
    ```
    
    teardownWithError()는 test 실행이 끝난 후마다 호출되는 메서드로 `setUpWithError()` 에서 설정한 값들을 해제할 때 사용된다.
    
    ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/086698e2-767e-43bf-9c93-e470eeb58b78/053870fc-0da2-409a-abd6-e4b129e3791e/Untitled.png)
    
    **testExample()**
    
    ```swift
    func testExample() throws { }
    ```
    
    test로 시작하는 메서드들은 test case가 되는 메서드이다. 메서드 네이밍의 시작은 무조건 `test` 로 시작되어야 하며 한글로도 작성이 가능하다.
    
    **@testable import {앱 타깃}**
    
    ```swift
    import XCTest
    @testable import UnitTestSample
    
    class StrangeCalculatorTests: XCTestCase {
        ...
    }
    ```
    
    - @testable은 unit test에서 실제 앱 타깃에 있는 코드들에 접근하기 위한 키워드이다. UnitTestSample이라는 타깃에 있는 코드를 작성하기 위해서 필요한 코드이다.
    - 보통 앱 코드 내부에서는 internal 수준의 접근 제한으로 타입을 만들어주는 것이 일반적이다. 그렇기 때문에 앱 타깃의 타입들에 외부 타깃에서 접근하는 것이 불가능한데, @testable은 테스트하는 동안에는 다른 타깃의 코드에 접근할 수 있도록 해주는 것이다.
    
    테스트 더블이란? 
    
    테스트를 진행하기 어려운 경우 이를 대신하여 테스트를 진행할 수 있도록 만들어주는 객체이다.
    
    테스트하는 동안에는 테스트 더블과 실제 객체를 잠깐 바꿔치기해서 테스트를 진행하게 된다.
    
    테스트 더블의 역할
    
    - 테스트 대상 코드를 격리한다.
    - 테스트 속도를 개선한다.
    - 예측 불가능한 실행 요소를 제거한다.
    - 특수한 상황을 시뮬레이션한다.
    - 감춰진 정보를 얻어낸다.

테스트 더블의 종류

1. Dummy(모조의, 가짜의)
    
    Dummy는 가장 기본적인 테스트 더블로, 기능이 구현되어 있지 않은 인스턴스화된 객체로 사용되기 때문에 Dummy의 메서드는 정상적으로 동작하지 않는다. 객체를 전달하기 위한 목적으로 주로 사용된다.
    
2. Stub (쓰다 남은 물건의 토막)
    
    Stub은 Dummy가 실제로 동작하는 것처럼 만들어 실제 코드를 대신해서 동작해주는 객체이다. 테스트가 곤란한 부분의 객체를 도려내어 그 역할을 최소한으로 대신해줄 만큼만 간단하게 구현되어 있다.
    
3. Fake
    
    Fake는 Stub보다 구체적으로 동작해서 실제 로직처럼 보이지만 실제 앱의 동작에서는 적합하지 않은 객체를 말한다. 로직 자체는 실제 앱의 코드와 비슷하지만 그 동작을 단순화하여 구현한 객체를 Fake 객체라고 한다.
    
4. Spy
    
    Spy는 Stub의 역할을 가지면서 호출된 내용에 대한 방법 혹은 과정 등 약간의 정보를 기록하는 객체이다. 예를 들어, 호출되었는지, 몇 번 호출되었는지 등에 대한 정보를 기록할 수 있다.
    
5. Mock
    
    실제 객체와 가장 비슷하게 구현된 수준의 객체라고 할 수 있다. Stub이 `상태 기반 테스트`라면 Mock은 `행위 기반 테스트`라고 할 수 있다.
