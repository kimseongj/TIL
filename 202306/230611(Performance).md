다형성은 무엇일까?

하나의 객체가 여러 가지 타입을 가질 수 있는 것



Performance



메모리는 어디에다 할당할까

Reference Counting은 얼마나 할까

메서드 디스패치는 어디서 할까



메모리 할당 

스택은 스택포인트를 내려서 할당하고 

스택포인트를 올려서 deallocate를 한다.



힙은 

사용되지 않는 블록을 찾아가는 할당 방법을 사용한다.



String은 버퍼(storage)라는 형태로 간접적으로 힙을 사용한다.

String은 대도록 덜 쓰는게 좋다.

String은 구조체이다. 

구조체로 대체하는 것이 좋은 방법



Reference Counting

![image-20230612100226262](/Users/ksj8277/Library/Application Support/typora-user-images/image-20230612100226262.png)



Method Dispatch

Static Dispatch

Dynamic Dispatch





![image-20230612102638293](/Users/ksj8277/Library/Application Support/typora-user-images/image-20230612102638293.png)



V-Table(VIrtual Table)



final 메서드를 사용하면 V-Table을 만들지 않아서 컴파일 타임에서 실행되어 Static Dispatch를 사용하게 된다.



Protocol Witness Table

 

Existential Container 

형태로 값을 감싼다. 