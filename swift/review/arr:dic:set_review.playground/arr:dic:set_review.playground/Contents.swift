import Swift

//MARK:- Array

var ig1: Array<Int> = Array<Int>()

//동일한 표현
var ig2: Array<Int> = [Int]()
var ig3: Array<Int> = []
var ig4: [Int]=[Int]()
var ig5: [Int]=[]
var ig6 = [Int]()

/*
 이구조를 보아하니
 -Array<Int> = [Int]
 -[Int]() = []
 */
//Array를 상수 선언하면 예상한대로 값 변환 불가
ig1.append(1)
ig1.append(3)
ig1.append(5)

print(ig1)
print(ig1.contains(3))
print(ig1.contains(4))

ig1.remove(at:0)
ig1.removeFirst()
ig1.removeLast()
ig1.removeAll()


//MARK:- Dictionary

var ad1: Dictionary<String, Any> = [String: Any]()

//위와 동일한 표현
var ad2: Dictionary<String, Any> = Dictionary<String, Any>()
var ad3: Dictionary<String, Any> = [:]
var ad4: [String: Any] = Dictionary<String, Any>()
var ad5: [String: Any] = [String: Any]()
var ad6: [String: Any] = [:]
var ad7 = [String: Any]()

/*
 Dictionary<String, Any> = [String: Any]
 Dictionary<String, Any>() = [String:Any]()
 */

ad1["kim"] = 123
ad1["Seo"] = "asdasd"
print(ad1)

//해당 값 삭제
ad1.removeValue(forKey: "kim")
ad1["Seo"] = nil
// nil이 들어갔는데 옵셔널 함수랑 연관이 있는 것인가

//MARK:- Set 중복되지 않는 멤버가 순서없이 존재하는 컬렉션 / 축약형 없음
var iss: Set<Int> = Set<Int>()//

iss.insert(1)
iss.insert(3)
iss.insert(6)
iss.insert(7)

print(iss)

//중복값은 중복되지 않고 하나의 값으로 남음 >> 멤버의 유일성이 보장되기 때문에 집합 연산에 활용하면 유용함

let setA: Set<Int> = [1,2,3,4,5]
let setB: Set<Int> = [3,4,5,6,7]

let union: Set<Int> = setA.union(setB)
print(union)

let sortedUnion: [Int] = union.sorted()
print(sortedUnion)

let intersection: Set<Int> = setA.intersection(setB)
print(intersection)
