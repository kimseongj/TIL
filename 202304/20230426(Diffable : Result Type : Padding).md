## Diffable Data Source

- Diffable DataSource란?

  - 달라질 수 있는 능력이 있는 DataSource라고 할 수 있다.

  - 기존 Data Source와 Diffable DataSource의 차이
    - 기존 Data Source는 서버에서 데이터를 받아오면 `reloadData()`라는 메서드를 통해 View를 재구성한다. 이 때, UX적으로 뚝뚝 끊기는 경험을 하게 된다. 
    - Diffable Data Source를 사용할 경우 변경된 데이터 부분에 대하여 자연스럽게 사라지고 추가되는 UI효과가 적용된다. 

  - IndexPath를 사용하지 않고, Hashable을 기반으로 동작한다.



- NSDiffableDataSourceSnapshot

  - UIState의 Truth이며 IndexPath 대신 Section과 Item의 Unique Identifier를 사용한다.

  - Section과 Item 모두 Hashable을 상속하거나 Hashable을 준수해야 한다.
  - **Cell에 어떤 종류의 데이터가 들어갈지만 정해놓고, 데이터를 Snapshot 형태로 사진을 찍어서 View에 반영한다.**
  - 데이터가 바뀌면 새로운 Snapshot을 만들어서 반영시키면 된다.




- CollectionView 구조

![](https://i.imgur.com/FseqSji.png)





![](https://i.imgur.com/KmJqMEp.png)



- Diffable Data Source 사용 순서

1. Connect a diffable data source to your collection view
2. Implement a cell provider to configure your collection view's cells
3. Generate the current state of the data
4. Display the data in the UI



### Diary 프로젝트 예시

- Section과 Item 타입 구현

```swift
struct Diary: Codable, Hashable {
    let title: String
    let body: String
    let createdAt: Int
    let identifier = UUID()

    enum CodingKeys: String, CodingKey {
        case title
        case body
        case createdAt = "created_at"
    }
}
```



- ViewController에서의 구현

```swift
class ViewController: UIViewController {
  private var dataSource: UITableViewDiffableDataSource<Section, Diary>!
  
  private func configureDataSource() {
        tableView.register(DiaryTableViewCell.self, forCellReuseIdentifier: DiaryTableViewCell.reuseIdentifier)
        
        dataSource = UITableViewDiffableDataSource<Section, Diary>(tableView: tableView, cellProvider: { tableView, indexPath, diary in
            let cell = tableView.dequeueReusableCell(withIdentifier: DiaryTableViewCell.reuseIdentifier, for: indexPath) as? DiaryTableViewCell
            
            cell?.configureCell(diary: diary)
            
            return cell
        })
    }
  
  private func applySnapshot() {
        guard diaries != nil else { return }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Diary>()
        snapshot.appendSections([.main])
        snapshot.appendItems(diaries!)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
```

