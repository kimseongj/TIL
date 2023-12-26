`AccessToken`을 안전하게 보관하는 방법이 무엇이 있을까 고민했을 때, `UserDefault`의 경우 `AcessToken`을 보관하기에 적합한 용량들을 저장할 수 있는 공간입니다. 하지만 데이터를 암호화지 않는 보안적인 문제가 생길 수 있습니다. 물로 다른 앱에서 쉽게 접근할 수 없지만 보안 수준이 낮습니다. 이를 보완하기 위해 `KeyChain` 사용을 채택했습니다. `KeyChain`의 경우 시스템에 의해 암호화되어 저장되기 때문에 `AccessToken`을 저장하기에 적합하다고 생각했습니다.



키체인은 쿼리들을 통해 `CRUD`를 구현할 수 있습니다. 

키 체인 서비스 API는 키체인이라는 암호화 된 데이터베이스에 사용자 데이터의 작은 비트를 저장하는 메커니즘을 앱에 제공한다.

**키체인 특징**

\- 앱을 삭제하더라도 데이터는 삭제되지 않음

\- 키체인 아이템은 정보와 속성으로 구성

\- iOS 앱은 단일 키체인에 접근할 수 있음

\- 사용자 기기 잠금 상태에 따라 키체인 잠금 상태도 동일하게 유지됩니다.



![image](https://github.com/kimseongj/TIL/assets/88870642/be3791d3-82bf-434e-9584-d28b84e33167)

숨겨야 할 데이터는 암호화하여 패키징 한 다음, 키체인 저장소에 보관된다.





### kSecClass 

- kSecClassGenericPassword : 일반 암호 항목을 나타내는 값
- kSecClassInternetPassword : 인터넷 암호 항목을 나타내는 값
- kSecClassCertificate : 인증서 항목을 나타내는 값
- kSecClassKey : 암호화 키 항목
- kSecClassIdentity : ID 항목을 나타내는 값

