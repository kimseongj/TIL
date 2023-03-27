![img](https://blog.kakaocdn.net/dn/biWwDi/btrq34pEH7v/WEB4Jlldw1jkJ1o5gkTgY0/img.png)



CocoaPods으로 Kingfisher를 설치하고 Xcode에서 다음과 같은 에러가 발생했습니다.

찾아보니 **Project 파일이 Xcode에서 수정되지 않아 병합 충돌이 발생**한 것입니다.

문제 해결을 위해 두 가지 해결책을 제시합니다.

\* **Read Form Disk**: 디스크에 저장된 변경사항을 기준으로 병합

\* **Keep Xcode Version**: 현재 상태를 유지