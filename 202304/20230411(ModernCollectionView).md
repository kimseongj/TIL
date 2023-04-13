##  Modern CollectionView

핵심 키워드 `Compositional layout`, `Diffable Data Source`

- Compositional Layout란?
  - UICollectionView에서 사용할 수 있는 Layout 중 하나
  - 공식 문서 상 , 유연하고 빠른 컬렉션 뷰의 레이아웃 형태를 구현할 수 있다고 한다.
  - 예시(make Grid Layout)

```swift
let customLayout: UICollectionViewCompositionalLayout = {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                         heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .fractionalWidth(0.2))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                     subitems: [item])

    let section = NSCollectionLayoutSection(group: group)

    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
}()
```

- CompositionalLayout.list란?
  - 테이블 뷰 형식처럼 vertical하게 생성되는 Layout이다.



- Diffable DataSource란?

  - 달라질 수 있는 능력이 있다.

  - 기존 Data Source와 Diffable DataSource의 차이
    - 기존 Data Source는 서버에서 데이터를 받아오면 `reloadData()`라는 메서드를 통해 View를 재구성한다. 이 때, UX적으로 뚝뚝 끊기는 경험을 하게 된다. 
    - Diffable Data Source를 사용할 경우 변경된 데이터 부분에 대하여 자연스럽게 사라지고 추가되는 UI효과가 적용된다. 

  - IndexPath를 사용하지 않고, Hashable을 기반으로 동작한다.



NSDiffableDataSourceSnapshot

- UIState의 Truth이며 IndexPath 대신 Section과 Item의 Unique Identifier를 사용한다.
- Section과 Item 모두 Hashable을 상속하거나 Hashable을 준수해야 한다.



![](https://i.imgur.com/FseqSji.png)





![](https://i.imgur.com/KmJqMEp.png)



hashable

https://www.zehye.kr/swift/2020/07/22/swift_hashable/



Diffable Data Source 사용 순서

1. Connect a diffable data source to your collection view
2. Implement a cell provider to configure your collection view's cells
3. Generate the current state of the data
4. Display the data in the UI



**Cell에 어떤 종류의 데이터가 들어갈지만 정해놓고, 데이터를 Snapshot 형태로 사진을 찍어서 View에 반영한다.**

데이터가 바뀌면 새로운 Snapshot을 만들어서 반영시키면 된다.



CellProvider

-  각 셀을 구성하여 UI 에 데이터를 표시하는 방법을 결정해준다.

## 참고

- [여기어때 기술블로그 - Compositional Layout과 Diffable DataSource로 홈 리팩토링하기](https://techblog.gccompany.co.kr/compositional-layout%EA%B3%BC-diffable-datasource%EB%A1%9C-%ED%99%88-%EB%A6%AC%ED%8C%A9%ED%86%A0%EB%A7%81%ED%95%98%EA%B8%B0-d80ac0d11edd)



