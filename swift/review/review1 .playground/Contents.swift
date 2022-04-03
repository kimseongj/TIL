import Swift

/*
 Lower Camel Case : function , method, variable, constant
    ex) someVariableName
 
 Upper Camel Case : type(class, struct, enum extension...)
    ex) Person, Point, Week
 */

var age : Int = 5

"hi i'm \(age) years old"


print("Hi i'm \(age) years old")

/*
 Any - swift의 모든 타입을 지칭하는 키워드
 AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
 nil -  없음을 의미하는 키워드
 */

var someAny : Any = 100
//  var someAny = 100


class SomeClass {}

var someAnyObject : AnyObject = SomeClass()
//  var someAnyObject = SomeClass()



/*
 Array
 Dictionanry : 키와 값의 쌍
 Set : 순서가 없고, 멤버가 유일한 컬렉션
 */
//MARK Array
var arr1 = [1,2,3,4,5]
var arr2: [Int] = [1,2,3,4,5]
var arr3 = Array(repeating:0, count:5)
var arr4: Array<Int> = Array(repeating:0, count:5)


arr1.append(1)
arr1.append(contentsOf:[2,2])
print(arr1)

arr1.contains(1)
arr1.contains(19)

arr1.remove(at : 0)
print(arr1)
arr1.removeLast()
print(arr1)
arr1.removeAll()
print(arr1)

var doubles: Array<Double> = [Double]()
// var doubles: [Double] = []
// var doubles = [1,2,3,4]

/*
 var strings : [String] = [String]()
 var strings : [String] = []
 */

let immutableArray = [1,2,3]


//MARK Dictionary
var anyDictionary : Dictionary<String, Any> = [String:Any]()
// var anyDictionary2 = [String:Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

anyDictionary["someKey"] = "dictionary"
anyDictionary

//anyDictionary.removeValue(forKey: "anotherKey")
anyDictionary["someKey"] = nil// value값이 nil이 되면 key값도 사라짐? 의미가 없어서?
print(anyDictionary)

let emptyDictionary: [String:String] = [:]

//Mark Set
var integerSet: Set<Int> = Set<Int> ()
var integerSet1 = Array<Int>()//
var integerSet2 = Set<Int>()//

integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(99)
print(integerSet)

integerSet.count

let setA:Set<Int> = [1,2,3,4,5]
let setB:Set<Int> = [3,4,5,6,7]
//let setB:Set<Int> = []
//let setB = Set<Int>()

let union: Set<Int> = setA.union(setB) // 합집합

let sortedUnion: [Int] = union.sorted() // 정렬

let intersection: Set<Int> = setA.intersection(setB) // 교집합

let subtarcting: Set<Int> = setA.subtracting(setB) // 차집합
