## TableView

### 테이블뷰란?

- 리스트 형태를 지니며, 스크롤링이 가능하다.
- 테이블뷰는 하나의 열(column)과 여러줄이 행(row)을 지니며, 수직으로만 스크롤이 가능하다.
- 각 행들은 셀(cell)이라고 불린다.
- 동일한 기능 및 형태가 비슷한 셀(cell)들을 구분 짓기 위해 섹션(section)이라는 개념을 사용한다. 
- 헤더(header)와 푸터(footer)에 이미지나 텍스트를 추가해 추가 정보를 보여줄 수 있다.

### 섹션 / 행

<img width="492" alt="스크린샷 2023-02-17 오후 4 15 29" src="https://user-images.githubusercontent.com/88870642/219575916-3df35d4f-b911-40ab-a722-e782d7a0dc1f.png" style="zoom:67%;" >

### Header / Footer 

<img width="478" alt="스크린샷 2023-02-17 오후 4 15 46" src="https://user-images.githubusercontent.com/88870642/219575925-7c6bafe1-89f6-4153-8602-a390bda9178b.png" style="zoom: 67%;" >



### 테이블뷰 스타일 

- 일반 테이블뷰

  - 더 이상 나뉘지 않는 연속적인 행의 리스트 형태이다.
  - 하나 이상의 섹션을 가질 수 있으며, 각 섹션은 여러 개의 행을 지닌다.
  - 각 섹션은 헤더 혹은 푸터를 옵션으로 지닐 수 있다.
  - 색인을 이용한 빠른 탐색을 하거나 옵션을 선택할 때 용이하다.
  - 예시

  <img src="https://user-images.githubusercontent.com/88870642/219849597-246b2bae-23a4-428a-8727-e8667c1ee0ee.png" alt="스크린샷 2023-02-18 오후 4 47 16" style="zoom:50%;" />

- 그룹 테이블뷰
  - 섹션을 기준으로 그룹화되어있는 리스트 형태이다.
  - 하나 이상의 섹션을 가질 수 있으며, 각 섹션은 여러 개의 행을 지닐 수 있다.
  - 각 섹션은 헤더 혹은 푸터를 옵션으로 지닐 수 있다.
  - 정보를 특정 기준에 따라 개념적으로 구분할 때 적합하다.
  - 사용자가 정보를 빠르게 이해하는데 도움이 된다.
  - 예시

<img src="https://user-images.githubusercontent.com/88870642/219849599-ab9a5837-b055-4759-83a2-f0875bceef75.png" alt="스크린샷 2023-02-18 오후 4 47 33" style="zoom:50%;" />

### 테이블뷰 셀

#### 테이블뷰 셀의 구조 

- 기본
  - 콘텐츠 영역: 텍스트, 이미지 등 입력
  - 액세서리뷰: 셀의 오른쪽 작은 부분의 액세서리뷰로 상세보기, 재정렬, 스위치 등과 같은 컨트롤 객체가 위치한다.



| <img src="https://user-images.githubusercontent.com/88870642/219849727-53653847-f2ec-42ff-ad3d-d9537a1b5fa0.png" alt="스크린샷 2023-02-18 오후 5 01 21" style="zoom:67%;"> | <img src="https://user-images.githubusercontent.com/88870642/219849958-33a19aa8-29db-4e97-9f1d-afe1e35d77bb.png" alt="image" style="zoom:67%;" /> |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
|                    셀 콘텐츠 / 액세서리뷰                    |                   이미지 / 주제목 / 부제목                   |



- 편집 모드

  - 편집 컨트롤: 삭제 컨트롤 또는 추가 컨트롤 중 하나가 될 수 있다.

  - 재정렬 컨트롤: 드래그하여 위아래로 순서 변경

    <img src="https://user-images.githubusercontent.com/88870642/219849757-e5f280d5-f8ca-4fb2-9e8d-f519915670ee.png" alt="스크린샷 2023-02-18 오후 5 13 32" style="zoom:67%;" />


### DataSource와 Delegate

- TableView 객체가 제대로 작동하려면 `DataSource`와 `Delegate` 두 객체가 필요하다.

- `DataSource`와 `Delegate`는 MVC패턴에서 C(Controller)의 역할을 한다. 
- 둘 다 프로토콜로 정의되어 있다.



#### DataSource

- 테이블뷰 데이터 소스 객체는 UITableViewDataSource 프로토콜을 채택한다.
- 테이블 뷰를 생성하고 수정하는데 필요한 정보를 테이블뷰 객체에 제공한다.
- 데이터 소스는 데이터 모델의 델리게이트로, 테이블뷰의 시각적 모양에 대한 최소한의 정보를 제공한다.
- 테이블뷰의 섹션 수와 행의 수를 알려주며, 행의 삽입, 삭제 및 재정렬하는 기능을 선택적으로 구현 할 수 있다.
- 필수 선언 요소

```swift
 @required 
 // 특정 위치에 표시할 셀을 요청하는 메서드
 func tableView(UITableView, cellForRowAt: IndexPath) 
 
 // 각 섹션에 표시할 행의 개수를 묻는 메서드
 func tableView(UITableView, numberOfRowsInSection: Int)
```

- Optional 선언 요소

```swift
 @optional
 // 테이블뷰의 총 섹션 개수를 묻는 메서드
 func numberOfSections(in: UITableView)
 
 // 특정 섹션의 헤더 혹은 푸터 타이틀을 묻는 메서드
 func tableView(UITableView, titleForHeaderInSection: Int)
 func tableView(UITableView, titleForFooterInSection: Int)
 
 // 특정 위치의 행을 삭제 또는 추가 요청하는 메서드
 func tableView(UITableView, commit: UITableViewCellEditingStyle, forRowAt: IndexPath)
 
 // 특정 위치의 행이 편집 가능한지 묻는 메서드
 func tableView(UITableView, canEditRowAt: IndexPath)

 // 특정 위치의 행을 재정렬 할 수 있는지 묻는 메서드
 func tableView(UITableView, canMoveRowAt: IndexPath)
 
 // 특정 위치의 행을 다른 위치로 옮기는 메서드
 func tableView(UITableView, moveRowAt: IndexPath, to: IndexPath)
```



#### Delegate

- 테이블뷰 델리게이트 객체는 `UITableViewDelegate`프로토콜을 채택한다.
- 델리게이트는 테이블뷰의 시작적인 부분 수정, 행의 선택 관리, 액세서리뷰 지원 그리고 테이블뷰의 개별 행 편집을 도와준다.

- 선언 요소 

```swift
// 특정 위치 행의 높이를 묻는 메서드
 func tableView(UITableView, heightForRowAt: IndexPath)
 // 특정 위치 행의 들여쓰기 수준을 묻는 메서드
 func tableView(UITableView, indentationLevelForRowAt: IndexPath)

 // 지정된 행이 선택되었음을 알리는 메서드
 func tableView(UITableView, didSelectRowAt: IndexPath)

 // 지정된 행의 선택이 해제되었음을 알리는 메서드
 func tableView(UITableView, didDeselectRowAt: IndexPath)

 // 특정 섹션의 헤더뷰 또는 푸터뷰를 요청하는 메서드
 func tableView(UITableView, viewForHeaderInSection: Int)
 func tableView(UITableView, viewForFooterInSection: Int)

 // 특정 섹션의 헤더뷰 또는 푸터뷰의 높이를 물어보는 메서드
 func tableView(UITableView, heightForHeaderInSection: Int)
 func tableView(UITableView, heightForFooterInSection: Int)

 // 테이블뷰가 편집모드에 들어갔음을 알리는 메서드
 func tableView(UITableView, willBeginEditingRowAt: IndexPath)

 // 테이블뷰가 편집모드에서 빠져나왔음을 알리는 메서드
 func tableView(UITableView, didEndEditingRowAt: IndexPath?)
```



- delegate : 사용자 인터렉션에 반응할 때 사용한다.

- Datasource : 데이터소스는 셀에 표시해줄 정보를 알려주는 역할을 한다.

- IndexPath는 Section과 Row로 이루어져있다.



#### 셀의 재사용

- iOS 기기는 한정된 메모리로 애플리케이션을 구동시킨다.

- 보여주고 싶은 데이터가 많으면 많을수록 생성해야하는 뷰의 개수와 메모리가 많아지게 되는데 한정된 메모리로 돌아가기 때문에 애플리케이션 구동이 원활하지 않을 수 있다.
- 이를 해결하기 위해서 반복된 뷰를 생성하기보다는 뷰를 재사용하여 애플리케이션을 구동시킨다.



#### 재사용 원리

![스크린샷 2023-02-21 오후 2 24 22](https://user-images.githubusercontent.com/88870642/220255093-fc8de50d-42a2-410e-aa35-47b316f598c9.png)