iOS에서 Clean Architecture



Dependency Rule

- 소스코드 종속성은 안쪽으로만 향할 수 있디.
- 내부 원으로 갈수록 외부원에 대해 아무것도 알 수 없다.
- 내부 원에서 외부원에 선언된 함수나 클래스 등을 언급하면 안된다.

![image](https://user-images.githubusercontent.com/88870642/223952693-c3a69b8c-fd3d-4a5d-9e7c-6cec3ea236a8.png)

![image-20230309164122167](/Users/ksj8277/Library/Application Support/typora-user-images/image-20230309164122167.png)



### Entity

엔티티란 "Enterprise wide business rules"을 캡슐화한다.

가장 높은 수준의 규칙을 캡슐화한다.

데이터 구조가 제일 높은 수준의 규칙이라고 할 수 있다. 왜냐하면 데이터 구조를 기반으로 UI가 구성되고, API가 구성되기 때문이다.

```swift
struct Movie: Equatable, Identifiable {
    typealias Identifier = String
    enum Genre {
        case adventure
        case scienceFiction
    }
    let id: Identifier
    let title: String?
    let genre: Genre?
    let posterPath: String?
    let overview: String?
    let releaseDate: Date?
}

struct MoviesPage: Equatable {
    let page: Int
    let totalPages: Int
    let movies: [Movie]
}
```



### Usecase 

- 시스템의 동작을 사용자의 입장에서 표현한 시나리오

- 시스템의 모든 Use cases를 캡슐화하고 구현한다.
- 엔티티와의 데이터 흐름을 조정하고, 해당 엔티티가 Usecase의 목표를 달성하도록 "지시"하는 역할이다.



### Interface Adapters

- Controllers, Gateways, Presenters가 있다.
- Presentation Layer라고도 불린다.
- Entity, Usecase에 가장 편리한 format에서 DB등과 같은 외부 프레임워크에 가장 편리한 format으로 변환되는 곳이다. 





![스크린샷 2023-03-09 오후 3 25 11](https://user-images.githubusercontent.com/88870642/223938461-895feeb2-f41c-4305-9f74-9677e73997c5.png)



escaping closure 공부해보기 













[Oleh Kudinov - Clean Architecture](https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3)

https://yoojin99.github.io/app/%ED%81%B4%EB%A6%B0-%EC%95%84%ED%82%A4%ED%85%8D%EC%B2%98/

https://zeddios.tistory.com/1065