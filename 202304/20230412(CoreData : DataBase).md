## 데이터 베이스 

- 여러 사람이 공유하여 사용할 목적으로 체계화해 통합, 관리하는 데이터의 집합이다.  

- 논리적으로 연관된 하나 이상의 자료의 모음으로 그 내용을 고도로 구조화함으로써 검색과 갱신의 효율화한 것이다.



### 데이터베이스의 종류

- 관계 데이터 모델 : 논리적 구조가 2차원 테이블 형태로 구성된 모델
- 계층 데이터 모델 : 논리적 구조가 트리 형태로 구성된 모델
- 네트워크 데이터 모델 : 논리적 구조가 그래프 형태로 구성된 모델



### 데이터 베이스의 특성

- 실시간 접근성 : 쿼리에 대하여 실시간 응답이 가능
- 계속적인 변화 : 새로운 데이터의 삽입, 삭제, 갱신으로 항상 최신의 데이터를 유지함
- 동시 공용 : 다수의 사용자가 동시에 같은 내용의 데이터를 이용할 수 있어야 함
- 내용 참조 : 사용자가 요구하는 데이터 내용으로 데이터를 찾아야 함



## 데이터베이스 관리 시스템 (DBMS)

- 데이터베이스를 운영하고 관리하는 소프트웨어



### 데이터베이스 관리 시스템 종류 

- 관계형 데이터베이스 관리 시스템 (RDBMS)
- 계층형 데이터베이스 관리 시스템 (HDBMS)
- 네트워크 데이터베이스 관리 시스템 (NDBMS)



### ORM(객체 관계 매핑)

데이터베이스와 객체 지향 프로그래밍 언어 간의 호환되지 않는 데이터를 변환하는 프로그래밍 기법이다.

객체 지향 언어에서 사용할 수 있는 "가상" 객체 데이터베이스를 구축하는 방법이다.



CoreData는 DataBase, DBMS, ORM 셋다 아니고 CoreData는 CoreData이다.



## CoreData

:fire:Core Data는 복잡하고 큰 user data를 저장하기에 적합하다. (UserDefaults는 app setting같은 간단한 정보를 저장하기에 적합)

:fire: Core Data는 데이터베이스도 아니며, 데이터를 유지하기 위한 API도 아니다. Core Data는 Framework이다. 

- Core Data는 앱 사용자의 데이터를 오프라인 사용을 위해 데이터를 영구적으로 저장하고, 임시적인 데이터를 캐시하는 등의 역할을 한다.
- 하나의 iCloud 계정의 여러 장치에서 데이터를 동기화하기 위해 Core Data는 스키마를 CloudKit 컨테이너에 자동으로 미러링한다.
- Core Data의 데이터 모델 편집기를 통해 데이터의 유형과 관계를 정의하고 각각의 클래스 정의를 생성한다.
- Core Data는 런타임에서 인스턴스를 관리한다.
- Core Data는 관계형 DB를 사용...?
- 비동기적으로 저장해주고 읽어 온다.
- Core Data의 **기능 중 하나** 인 Persistence는 관계형 데이터베이스인 SQLite에 의해 지원된다.



### Persistence(저장)

- Core Datas는 객체를 저장소에 매핑하는 세부 정보를 추상화하여 DB를 직접 관리하지 않고도 Swift 데이터를 쉽게 저장할 수 있다.

![](https://i.imgur.com/M0UZsRd.png)

### Undo and Redo of Individual or Batched Changes (실행, 실행 취소)

- Core Data의 실행 취소 관리자는 변경 사항을 추적하고 개별적으로나 그룹적으로 한 번에 롤백할 수 있어 앱에 Undo 및 Redo를 쉽게 추가할 수 있다.
- 아래 그림은 그러한 제스처를 사용하여 실행 취소하는 것을 보여준다.


![](https://i.imgur.com/EPkHdsi.png)

### Background Data Tasks (백그라운드 데이터 작업)

- JSON을 개체로 구문 분석하는 것과 같은 데이터 작업을 백그라운드에서 수행한다. 그런 다음 결과를 캐시하거나 저장하여 서버 왕복을 줄일 수 있다.

![](https://i.imgur.com/FcrQoRa.png)

### View Synchronization(동기화)

- Core Data는 테이블 뷰, 컬렉션 뷰들의 데이터 소스들을 동기적으로 유지하게 해준다.



### Versioning and Migration(버전 관리)

- Core Data에는 데이터 모델의 버전을 관리하고 앱이 발전함에 따라 사용자 데이터를 마이그레이션 하는 메커니즘이 있다.



## Core Data 사용해보기

1. 프로젝트 생성 시  `Use Core Data` 체크하기

![](https://i.imgur.com/AZJt6Zw.png)



![](https://i.imgur.com/lOYiT4i.png)

- Manual / None
  - 관리 객체 하위 클래스의 프로퍼티, 논리를 편집
- Class Definition
  - 생성된 논리나 프로퍼티를 편집할 필요가 없을 경우 선택
- Category / Extension
  - 관리 객체 하위 클래스에 추가적인 메서드나 비즈니스 논리를 추가하고 싶은 경우 선택









1. Window는  앱의 사용자 인터페이스에 대한 배경과 뷰에 이벤트를 전달하는 개체이며, ViewController와 함께 작동하여 이벤트를 처리하고 앱 작동의 기본이 되는 작업들을 수행합니다. 또한, 앱의 콘텐츠를 표시하는 기본 Window로 추가 콘텐츠를 표시하려면 새로운 window가 필요합니다. 즉, App에 필요한 View들을 담는 그릇이라고 생각됩니다.



2. Scene iOS13에 새롭게 등장한 UI개념으로, 아이패드에서 Multi Scene을 구현할 수 있도록 하기 위해 만들어졌다고 합니다! Scene은 window의 상위 개념으로 하나 또는 그 이상의 window를 포함하여 App UI의 하나의 인스턴스를 관리한다고 합니다.



3. SceneDelegate는 AppDelegate에서의 기능이 분리된 것으로, AppDelegate는 앱의 lifeCycle을 포함하여, 애플리케이션 수준의 이벤트를 처리하며, SceneDelegate는 화면(window 혹은 scene)에 표시되는 내용을 처리하고 앱이 표시되는 방식을 관리합니다.