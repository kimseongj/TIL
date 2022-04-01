import Swift

//반복문

var integers = [1,2,3]
let people = ["kim":10, "eric":15, "mike": 12]

//for- in

for integer in integers {
    print(integer)
}

//Dictionary의 item은 key와 value로 구성된 튜플 타입임
for(name, age) in people {
    print("\(name):\(age)")
}

//MARK - while
while (integers.count > 1){
    integers.removeLast()
}

//MARK - repeat-while  do-while 역할
repeat {
    integers.removeLast()
} while integers.count > 0





