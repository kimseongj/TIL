# 20220914

## #Xcodegen



# XcodeGen

How to install XcodeGen?

1. brew를 통해 xcodegen 설치 

``` bash
brew install xcodegen
```



2. 프로젝트 파일에 yml 파일 만들기 (프로젝트 이름과 상관없이 "project.yml")

![image-20220913114932045](/Users/ksj8277/Library/Application Support/typora-user-images/image-20220913114932045.png)



3. Xcodeproj 파일 git.ignore 하기



4. Pods 폴더 git.ignore



5. xconfig 파일 추출하기

​	xcodegen은 프로젝트를 생성할 때 xconfing 파일, yaml파일을 사용

​	xconfig란?

​	프로젝트는 Debug, Release, Profile 세가지 configuration을 사용함

​	Xcode로 프로젝트를 생성하면 세가지 configuration에 맞는 설정이 기본값으로 지정되고 팀 내에서 필요한 대로 수정해서 사용함

​	이 값들은 Xcode - Build Setting에서 확인 가능 



6. Xcodegen generate



- yml 파일 만들기 예시 

```
name: DemoApp
packages:
  RxSwift:
    url: https://github.com/ReactiveX/RxSwift
    from: 5.0.1
  RxCocoa:
    url: https://github.com/ReactiveX/RxSwift
    from: 5.0.1
  SnapKit:
    url: https://github.com/SnapKit/SnapKit
    from: 5.0.1
  RxBiBinding:
    url: https://github.com/RxSwiftCommunity/RxBiBinding
    from: 0.2.5
  CombineDataSources:
    url: https://github.com/CombineCommunity/CombineDataSources
    from: 0.2.4
  RxKeyboard:
    url: https://github.com/RxSwiftCommunity/RxKeyboard
    from: 1.0.0
  RxViewController:
    url: https://github.com/devxoul/RxViewController
    from: 1.0.0
  RxExpect:
    url: https://github.com/devxoul/RxExpect
    from: 2.0.0
targets:
  DemoApp:
    settings:
      base:
        INFOPLIST_FILE: memo/Info.plist
        PRODUCT_BUNDLE_IDENTIFIER: com.myapp
    type: application
    platform: iOS
    deploymentTarget: 13.0
    sources: 
      [memo]
    dependencies:
      - package: RxSwift
      - package: RxCocoa
      - package: SnapKit
      - package: RxBiBinding
      - package: CombineDataSources
      - package: RxKeyboard
      - package: RxViewController
출처: https://sesang06.tistory.com/183 [세상 끝 조그만 서가:티스토리]
```



실행해본 결과.. 

```
The application's Info.plist does not contain a valid CFBundleVersion.
Recovery Suggestion: Ensure your bundle contains a valid CFBundleVersion.
```

라는 오류 메세지 나옴.. 하.. 해결해되면 해결책을 작성해야겠다.



## 참고

- https://medium.com/daangn/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EC%97%90-xcodegen-%EB%8F%84%EC%9E%85%ED%95%98%EA%B8%B0-d0fd54691aad
- https://eeyatho.tistory.com/66
- https://pilgwon.github.io/post/hello-xcodegen
