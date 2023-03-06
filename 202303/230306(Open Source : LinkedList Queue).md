# Open Source 

### Open Source란?

소스코드를 공개해 누구나 특별한 제한 없이 그 코드를 볼 수 있도록 한 소스코드이다.



### 의존성 관리도구란?

- 외부 라이브러리를 사용할 때 프로젝트와 해당 라이브러리의 상관관계를 용이하게 관리해주는 도구

- Cocoa 및 Cocoa Touch 애플리케이션 개발 환경에서는 코코아팟, 카르타고, 스위프트 패키지 매니저 등이 있다.



### 오픈소스 라이선스

- 오픈소스에 항상 뒤따라 오는 것이 오픈 소스 라이선스이다. 라이선스 종류에는 Apache, GPL, MIT, BSD 등 다양한 라이선스가 존재한다. 각 라이선스마다 다양한 조건이 있으므로 오픈 소스를 사용할 때나 배포할 때 주의가 필요하다.



### 코코아팟이란?

Swift 및 Objective-C 언어 환경 프로젝트의 의존성을 관리해주는 도구이다.



### 코코아팟 사용법

1. 터미널에 `sudo gem install cocoapods`입력하여 다운받기

```swift
sudo gem install cocoapods
```



2. 현재 작업하는 프로젝트 폴더에 들어가서 `pod init`입력하여 다운받기

```swift
pod init 
```



3. `vi Podfile`을 입력해서 Podfile을 열고 Pod을 명시해준다.

```swift
vi Podfile
```

- Podfile

```swift
target '현재 프로젝트' do
	use_frameworks!
	pod 'Alamofire', '~> 3.0'
```



4. 현재 작업하는 프로젝트 폴더에 `pod install`을 하면 위에 명시했던 "Alamofire"라는 라이브러리를 프로젝트로 받아오게 된다.

```swift
pod install
```



5. 위 작업들을 마치면, `.xcodeproj`가 아닌 `.xcworkspace`프로젝트 파일을 열어 작업을 해야 한다. 



6. `.xcworkspace`파일에서 `import Alamofire를 작성하면 라이브러리를 사용할 수 있다.

```swift
import Alamofire
```



### 카르타고란?

코코아 애플리케이션에 간단하게 프레임워크(혹은 라이브러리)를 추가할 수 있도록 도와주는 의존성 관리 도구이다. 카르타고는 코코아팟과 다르게 프로젝트 파일이나 빌드 설정을 자동으로 수정하지 않는다. 그렇기 때문에 빌드 속도가 빠르다. 특히 클린 빌드를 할 경우 그 차이가 매우 크게 느껴진다.



### iOS 환경에서의존성 관리도구의 종류

- 코코아팟
- 카르타고
- 스위프트 패키지 매니저



### 장단점

- 코코아팟 장점
  - pod outdated 명령어로 쉽게 새로운 버전이 있는지 체크할 수 있다.
  - 거의 대부분의 라이브러리가 코코아팟을 지원한다. 👍
- 코코아팟 단점
  - 라이브러리를 다운받아 설치(pod install or update)하는데 오랜 시간이 걸린다.
  - 프로젝트를 빌드 할 때마다 모든 팟 라이브러리가 같이 빌드되므로 다른 도구를 사용할 때 보다 프로젝트 빌드 시간이 느리다.
- 카르타고 장점
  - carthage outdated 명령어로 쉽게 새로운 버전이 있는지 체크할 수 있다.
  - carthage update 를 실행할때만 한 번 프레임워크를 빌드하므로 코코아팟에 비해 프로젝트 빌드 속도가 빠르다.
  - 처음에 프레임워크를 추가하는 것 외에 프로젝트 설정이 바뀌지 않는다.
- 카르타고 단점
  - 의존성이 추가될 때마다 해줘야 하는 번거로운 작업이 있다.
  - 사용자나 인기가 많은 라이브러리가 아니라면 카르타고를 지원하지 않을 수도 있다.
- 스위프트 패키지 매니저 장점
  - 애플이 지원한다.
  - 스위프트 언어에 built-in 되어있어 별다른 설치가 필요없다. (Swift 3 이상)
  - 스위프트 언어에 built-in 되었기 때문에 Xcode Project 파일이 꼭 필요한 것이 아니므로 리눅스에서도 사용할 수 있다.
  - Package.swift 파일 이외에 수행할 설정이 없다.
  - Xcode의 GUI 환경에서 관리가 가능하다 (11.0 버전 이상)
- 스위프트 패키지 매니저 단점
  - 아직은 지원하지 않는 라이브러리가 많다.
  - 현 시점, 해결되지 않은 이슈가 270건이 있다.



### 의존성 관리도구를 사용하는 이유

- 만들어진 오픈소스, 즉 외부 라이브러리를 직접 프로젝트에 적절히 포팅하는 작업을 일일이 다 해줘야하며, 외부 라이브러리의 버전이 올라가면, 라이브러리 또한 새로운 버전으로 일일이 교체해주는 작업이 필요하다.
- 휴먼 에러가 생기기 쉽상이다.
- 이런것을 쉽게 관리하기 위해 의존성 관리도구를 사용해야 한다.



### 의존성 관리도구와 Git을 함께 사용할 때 주의할 점

- 일반적으로 의존성을 Git에 올리지 않고 버전만 명시하여 올린다고 하기 때문에, 협업하는 팀원이 모두 같은 버전의 라이브러리를 적용하고 있는지 확인해야 한다.
- 협업 시 동일한 의존성 관리도구를 사용해야 한다.



# 단방향 연결리스트 큐 구현

```swift
import UIKit


final class Node<T> {
    let data: T
    var next: Node<T>?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    mutating func enqueue(data: T) {
        if head == nil {
            head = Node.init(data: data)
            tail = head
        }
        
        let newNode = Node.init(data: data)
        
        tail?.next = newNode
        tail = newNode
    }
    
    mutating func dequeue() -> T? {
        if head == nil {
            return nil
        }
        let dequeue = head
        head = head?.next
        dequeue?.next = nil
        
        return dequeue?.data
    }
}

```

