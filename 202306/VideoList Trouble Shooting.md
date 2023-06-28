```swift
 button.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
```

- 원리는 top, bottom, left, right 모두에 30 inset값을 적용시켜 이미지 크기를 늘리는 것이다. 

> inset을 하게 될 경우 Button과 Image 사이의 margin이 생긴다. 이 때, top만 30을 적용시킨다면 Image는 Button의 top과 30의 margin이 생겨 밑에서 찌그러진 형태로 나올 것이다. 하지만 top, bottom, left, right 모두 inset을 주게 될 경우 오히려 Image의 크기가 늘어난다. 



![image](https://github.com/kimseongj/TIL/assets/88870642/35ca8270-8989-4661-be76-7a49838780f5)

위와 같이 iOS 15부터는 `UIButtonConfiguration`을 사용하게 되면 무시된다고 나와 있다.



![image](https://github.com/kimseongj/TIL/assets/88870642/4d0832c6-9cdf-4919-a3a1-c5c62cb9a246)

```swift
DispatchQueue.global(qos: .background).async {
                session.startRunning()
        }
```





```swift
private var dataSource: UITableViewDiffableDataSource<Section, Motion>!

private enum Section: CaseIterable {
    case main
}

private let tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundColor = .blue
   return tableView
}()

private func configureUI() {
    let safeArea = view.safeAreaLayoutGuide
    
    view.addSubview(tableView)
    
    NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
    ])
}
```

