제네릭 타입으로 `Section`과 `item`타입을 받습니다. 

이 때 제네릭 타입들은 `Hashable`을 준수해야 합니다. 



## Diffable Data Source 적용

> Diffable DataSource는 CollectionView, TableView의 Cell들이 데이터의 변화에 따라 cell들을 재구성하는 역할을 합니다. 이는 물론 DataSource에 존재하는 기능입니다. 하지만 DataSource를 사용할 경우 애니메이션 효과 부분에서 사용자의 UX를 저하시킬 수 있습니다. 이런 부분을 해결하기 위해 DiffableDataSource는 데이터의 달라진 부분을 추적하고 자연스러운 애니메이션을 통해 UI를 업데이트 합니다.



:fire: **주의 사항**

- IndexPath를 사용하지 않고, Hashable을 기반으로 동작합니다.

- UIState의 Truth이며 IndexPath 대신 Section과 Item의 Unique Identifier를 사용합니다. `DiffableDataSource`은 제네릭 타입으로 `Section`과 `item`타입을 받습니다. 이 때 제네릭 타입들은 `Hashable`을 준수해야 합니다. 



:fire: **사용원리**

1. **Connect a diffable data source to your collection view**
   - `DiffableDataSource`를 `CollectionView`가 있는 `ViewController`에 만들어줍니다.

2. **Implement a cell provider to configure your collection view's cells**
   - `CellProvider`를 구현하여, `cell`을 만드는 방식을 구현합니다.

3. **Generate the current state of the data**
   - 데이터에 대한 `snapshot`을 찍어 `DiffableDataSource`에 적용하고 상태를 변화시킵니다.

4. **Display the data in the UI**
   - `UI`에 변화된 상태의 CollectionView를 보여줍니다.

(Apple 공식문서 인용)



