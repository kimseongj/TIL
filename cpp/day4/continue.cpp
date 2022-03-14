#include<iostream>

main(){
    int i;
    int except_num = 3;

    for(i=1; i<=100; i++)
    {
        if(i%except_num == 0)
        {
            continue;
        }
        printf("%d", i);
    }
}

// continue 사용시 값이 참일경우 위에 문장을 실행 (3,6,9게임 같은 느낌)