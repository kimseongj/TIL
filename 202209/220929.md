# 220929

## API

### API란?

프로그램과 프로그램이 상호작용하는 것을 도와주는 매개체이다. 

서버와 클라이언트

GET : 데이터를 얻고 싶을 때 요청

HEAD: 헤더 정보를 얻고 싶을 때 요청

POST: 내용을 전송하고 싶을 때 사용

PUT: 내용을 갱신하고 싶을 때 사용



### API 인증키란?

정보를 얻기 위해 데이터베이스에 접근할 때 읽을 수 있는 권한을 가진 사람에게 API인증키를 부여하여 인증키를 통해 데이터베이스에 접근



## Session이란

클라이언트의 상태 정보 유지 기술 : 쿠키(Cookie)

서버의 상태 정보 유지 기술 : 세션(Session)

세션은 클라이언트 별로 각각의 상태 정보를 서버에 저장하는 기술

사용자가 웹 브라우저를 통해 웹서버에 접속한 시점으로부터 웹 브라우저를 종료하여 연결을 끝내는 시점까지, 같은 사용자로부터 오는 일련의 요청을 하나의 상태로 보고, 그 상태를 일정하게 유지하는 기술.
즉, 방문자가 웹 서버에 접속해있는 상태를 하나의 단위로 보고 그것을 세션이라고 한다.



서버가 상태정보를 유지할 수 없다면, 클라이언트는 연속적인 동작이 불가능하다.

하나의 예시로는 온라인 쇼핑몰의 장바구니 개념이다.

클라이언트가 쇼핑몰에서 여러가지 상품을 구매하려고 장바구니에 상품을 담았다고 가정해보자.

하나의 상품을 담는 작업을 하면, 서버는 장바구니에 보관할 것이다. 

로그인을 예로 들면, 로그인이 되어 있는 상태를 유지하지 않는다고 하면 로그인을 반복적으로 해야 할 것이다. 

그래서 클라이언트 별로 세션 ID를 부여하고 상태 정보를 유지한다.

## URLSession사용법

### URLSession이란?

- 앱에서 서버와 통신하기 위해 애플이 제공하는 API

- HTTP를 포함한 몇 가지 프로토콜을 지원하고 인증, 쿠키 관리, 캐시 관리 등을 지원 

- 리퀘스트를 보내고 받는 것을 책임지는 중요한 객체



```swift
// URLComponents와 URLSession을 이용하여 URLSessionDataTask 생성
guard let requestURL = urlComponents?.url else { return }
let dataTask = session.dataTask(with: requestURL) { (data, response, error) in

    // error가 존재하면 종료
    guard error == nil else { return }

    // status 코드가 200번대여야 성공적인 네트워크라 판단
    let successsRange = 200..<300
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
          successsRange.contains(statusCode) else { return }

    // response 데이터 획득, utf8인코딩을 통해 string형태로 변환
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    print(resultData)
    print(resultString)
}

// network 통신 실행
dataTask.resume()
```



🌀 **URLSession은 HTTP/HTTPS를 통해 콘텐츠 및 데이터를 주고받기 위해 API를 제공하는 클래스**

*Request*\- URL 객체와 직접 통신하는 형태
\- URLRequest 객체를 직접 만들어서 옵션을 설정해서 통신하는 형태

 *Response*
\- Task의 Completion Handler를 통해서 응답 받는 방식
\- URLSessionDelegate의 메소드를 통해서 응답 받는 방식



Decodable : JSON -> 모델
Encodable : 모델 -> JSON

→ Decodable과 Encodable을 typealias로 묶어 Codable protocol로 통칭한다.




URLSessionDataTask : 서버로부터 데이터를 가져와서 메모리에 저장하는 GET요청에 대한 작업에 사용함 

Resume / cancel / suspend

URLSessionUploadTask : POST 또는 PUT 메소드를 통해 디스크로부터 웹 서비스로 파일을 업로드하는 작업

URLSessionDownloadTask : 원격 서비스로부터 파일을 임시 파일 위치로 다운로드하는 작업에 사용



### URLSession 통신단계

1. URL 생성
2. URLSession 생성
3. URLSession에 task 부여
4. task 시작



**URLSession 사용 순서**

1. Configuration을 결정
2. Session 생성
3. Request에 사용할 url 설정
4. Task 결정 및 작성





### DataTask

- Data를 받는 작업과 Response(응답) Data를 메모리 상에서 처리하는 역할





## 참고

- https://cheershennah.tistory.com/135

- https://crossjin.tistory.com/entry/%EC%84%B8%EC%85%98Session%EC%9D%B4%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%BC%EA%B9%8C

- https://greatpapa.tistory.com/66