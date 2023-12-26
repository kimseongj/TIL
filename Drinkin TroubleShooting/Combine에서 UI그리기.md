> Combine으로 sink하여 Publisher의 전달값을 전달받을 때, 아래와 같은 오류를 직면했습니다. 이는 Combine을 통해 비동기처리를 할 경우 백그라운드 스레드에서 돌아가는 것을 처리하지 못해서 생긴 오류였습니다.

:fire: **Main Thread에서 실행시키자**

UI를 변경시키거나, 초기화할 때는 `Main Thread`에서 구현해야 합니다. Publisher의 `receive`메서드를 사용하여 Thread를 `MainThread`로 변경시시키고 `subscribe`하여 문제를 해결했습니다. 

![image](https://github.com/kimseongj/TIL/assets/88870642/51076875-34e6-4eba-b9c1-8365af6bcf68)



:fire: **`receive` 메서드를 통해 `Main Thread`에 실행시킨 모습**



```swift
Publisher.receive(on: RunLoop.main).sink
```

