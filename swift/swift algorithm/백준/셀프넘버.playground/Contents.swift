var sum : Int = 0
var temp : Int = 0
var rest : Int = 0
var selfnum = Set<Int>()

for j in 1...10000 {
    selfnum.insert(j)
}

for i in 1...10000 {
    temp = i
    sum = 0
    while temp != 0 {
        rest = temp%10
        temp = temp/10
        sum += rest
    }
    selfnum.remove(i + sum)
    
}
// print(selfnum.sorted())

for f in selfnum.sorted() {
    print(f)
}


// 세트를 그냥 for문에 돌렸으면 쉬웠을걸.... 바보같이
