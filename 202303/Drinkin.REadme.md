# Tailbe ReadMe

## CocoaPods

1. CocoaPods 설치한다.

```swift
$sudo gem install cocoapods
```

2. 해당 프로젝트 경로로 이동하여 아래 명령어 입력한다.

```swift
$pod init
```

3. 해당 프로젝트 폴더를 열면  아래와 같이 `Podfile` 파일이 생성되어 있다.

<img width="713" alt="스크린샷 2023-03-24 오후 8 58 12" src="https://user-images.githubusercontent.com/88870642/227516370-f4e8a30f-d1ba-4e90-a841-9114db200384.png">

4. `vi Podfile`을 입력해서 Podfile에 들어간다. 

```swift
$vi Podfile
```



5. 아래와 같이 `pod 'SnapKit'`을 입력한다.

<img width="496" alt="스크린샷 2023-03-24 오후 9 08 23" src="https://user-images.githubusercontent.com/88870642/227517480-cd126403-267f-4745-9685-2244ab16837e.png">



6. Podfile을 위와 같이 저장하고 터미널로 돌아와서 `pod install`을 입력해준다.

```swift
$pod install
```

