## 문제사항
- 프로젝트를 진행함에 있어 Merge Conflict가 났었다. 
- 이를 해결하기 위해 구글링을 열심히 해본 결과, gitignore에 이미 commit된 항목을 넣을 경우 gitignore가 적용되지 않는다. 

## 해결방법
- 이를 해결하기 위해 아래와 같이 `git rm -r --cached`를 입력해준다.
- 그 이후 커밋해주면 정상적으로 gitignore가 적용된다.
```
git rm -r --cached .
git add .
git commit -m ''
git push 
```