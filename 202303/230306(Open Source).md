# Open Source 

## Open Source란?

소스코드를 공개해 누구나 특별한 제한 없이 그 코드를 볼 수 있도록 한 소스코드이다.



의존성 관리도구란?

외부 라이브러리를 사용할 때 프로젝트와 해당 라이브러리의 상관관계를 용이하게 관리해주는 도구



Cocoa 및 Cocoa Touch 애플리케이션 개발 환경에서는 코코아팟, 카르타고, 스위프트 패키지 매니저 등이 있다.



오픈소스 라이선스

오픈소스에 항상 뒤따라 오는 것이 오픈 소스 라이선스이다. 라이선스 종류에는 Apache, GPL, MIT, BSD 등 다양한 라이선스가 존재한다. 각 라이선스마다 다양한 조건이 있으므로 오픈 소스를 사용할 때나 배포할 때 주의가 필요하다.



코코아팟이란?

Swift 및 Objective-C 언어 환경 프로젝트의 의존성을 관리해주는 도구이다.



코코아팟 사용법

1. 터미널에 `sudo gem install cocoapods`입력하여 다운받기

```
sudo gem install cocoapods
```



2. 현재 작업하는 프로젝트 폴더에 들어가서 `pod init`입력하여 다운받기

```
pod init 
```



3. `vi Podfile`을 입력해서 Podfile을 열고 Pod을 명시해준다.

```
vi Podfile
```

- Podfile

```
target '현재 프로젝트' do
	use_frameworks!
	pod 'Alamofire', '~> 3.0'
```



4. 현재 작업하는 프로젝트 폴더에 `pod install`을 하면 위에 명시했던 "Alamofire"라는 라이브러리를 프로젝트로 받아오게 된다.

```
pod install
```



5. 위 작업들을 마치면, `.xcodeproj`가 아닌 `.xcworkspace`프로젝트 파일을 열어 작업을 해야 한다. 



6. `.xcworkspace`파일에서 `import Alamofire를 작성하면 라이브러리를 사용할 수 있다.

```
import Alamofire
```





카르타고란?

코코아 애플리케이션에 간단하게 프레임워크(혹은 라이브러리)를 추가할 수 있도록 도와주는 의존성 관리 도구이다. 카르타고는 코코아팟과 다르게 프로젝트 파일이나 빌드 설정을 자동으로 수정하지 않는다. 그렇기 때문에 빌드 속도가 빠르다. 특히 클린 빌드를 할 경우 그 차이가 매우 크게 느껴진다.



카르타고 사용법

1. `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`를 사용하여 Homebrew 설치

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```



2. Homebrew를 통하여 카르타고를 설치한다. (`brew install carthage`)

```
brew install carthage
```



3. 