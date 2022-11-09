GCD (: Grand Central Dispatch)

DispatchQueue

작업 항목의 실행을 관리하는 클래스이다.

장점 : 일반 Thread보다 쉽고 효율적으로 코드를 작성할 수 있다.

보통 서버에서 데이터를 받고 이미지 동영상을 외부에서 다운로드 및 처리할 때 CPU 사용량이 많아 처리를 별도의 Thread에서 처리한 뒤 Main Thread로 결과만을 전달하여 화면에 표시하도록 하여 CPU 관리할 수 있다. 



Serial : 시작한 작업이 끝날때까지 순차적으로 실행하는 직렬 형태의 Queue



Concurrent : 이전 작업이 끝날 때까지 기다리지 않고 병렬 형태로 동시에 실행되는 Queue. 즉 대기열에 있는 작업을 동시에 별도의 Thread를 사용하여 실행 



GCD에서 제공하는 Queue

Main(Serial)

Main Thread에서 처리되는 형태이며 Xcode의 UIKit 및 SwiftUI의 모든 요소들은 Main Queue에서 수행되어야 한다.



Global(concurrent)

시스템 전체에 공유되는 concurrent Queue로 병렬적으로 동시에 실행이 되며, QoS를 통해 우선순위를 정한다.



QoS란?

DispatchQueue에서 수행할 작업을 분류하기 위해 사용된다.

QoS를 지정해줘서 시스템의 우선순위를 정하고 이에 따라 스케쥴링을 하게 된다. 



- Sync (동기)

  작업이 시작되면 Queue가 block 상태가 되며, 그 작업이 끝나야만 Queue에 컨트롤을 넘긴다.

  ```swift
  import UIKit
   
  var greeting = "Hello, playground"
   
  DispatchQueue.global(qos: .background).sync {
      for item in 1...10 {
          print("sync : \(item)")
      }
  }
   
  for item in 50...60 {
      print(item)
  }
  ```

  

- Async(비동기)

  작업을 수행할 다른 Queue에게 작업을 넘기며 현재 Queue에게 컨트롤을 돌려준다. 

```swift
import UIKit
 
var greeting = "Hello, playground"
 
DispatchQueue.global(qos: .background).async {
    for item in 1...10 {
        print("Async (1) : \(item)")
    }
}
 
DispatchQueue.global(qos: .background).async {
    for item in 30...40 {
        print("Async (2) : \(item)")
    }
}
 
for item in 90...100 {
    print(item)
} //막 섞여서 실행된다. 
```



## 참고

https://seons-dev.tistory.com/entry/Swift-DispatchQueue%EB%9E%80-GCD-Grand-Central-Dispatch