## UIView에서 `Init`하는 방법 

- `UIView`에는 3가지 `init`이 있다.

  - init(frame:)

  - init(coder:)

    - 

  - init()

    - <img width="708" alt="image" src="https://github.com/kimseongj/TIL/assets/88870642/96b7bb62-9267-47f1-8780-d9619b9735d4">

    - 공식문서상 `UIView`는 `UIResponder`를 상속받고, `UIResponder`는 `NSObject`를 상속받는다. 

      

```swift
init(delegate: MainViewDelegate?) {
            super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
```

