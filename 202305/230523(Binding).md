Observable

```swift
class Observable<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
```

- value를 통해



ViewModel

```swift
class ObservableViewModel {
  var student: Observable<[Employee]> = Obsevable([])
  
  func fetchStudent() {
    self.apiManager!.getEmployees { (result: DataResponse<EmployeesResponse, AFError>) in
            switch result.result {
            case .success(let response):
                if response.status == "success" {
                    self.employees = Observable(response.data) // (3)
                    return
                }
        }
  }
}
```



ViewController

```swift
class ViewController {
	override func viewDidLoad() {
    viewModel.employees.bind { _ in
    self.showTableView()
		}
  }
}
```





Combine

```swift
class CombineViewModel {
  var apiManager: APIManger?
  @Published var student: [Student] = []
  
  func fetchEmployees() {
    self.apiManager
  }
}
```

