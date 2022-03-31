//컬렉션 타입
//Array, Dictionary, Set
/*
 Array - 순서가 있는 리스트 컬렉션
 Dictionary - 키와 값의 쌍으로 이루어진 컬렉션
 Set - 순서가 없고, 멤버가 유일한 컬렉션
 */

import Swift

//빈 Int Array 생성
var integers: Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)//append - 추가
//integers.append(101.1) 타입이 맞지않아 컴파일 오류

integers.contains(100)// contains - 포함
integers.contains(99)

integers.remove(at:0) // 0번째 들어있는 수 제거
integers.removeLast()
integers.removeAll()

integers.count
//integers[0] 비워져있기 때문에 오류

//Array<Doble>와 [Double]은 동일한 표현
//빈 Double Array 생성
var doubles : Array<Double> = [Double]()

//빈 String Array 생성
var strings : [String] = [String]()

var characters : [Character] = []

let immutableArray = [1,2,3]

// immutableArray.append(4)
// immutableArray.removeAll() : 불가 상수로 선언하였기 때문


//Dictionary
//Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성

var anyDictionary : Dictionary<String, Any> = [String: Any]()

anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

anyDictionary

anyDictionary["someKey"] = "dictionary"
anyDictionary

anyDictionary.removeValue(forKey: "anotherKey")

anyDictionary["someKey"] = nil
anyDictionary

let emptyDictionary : [String:String] = [:]
let initalizedDictionary : [String: String] = ["name":"Kim","gender": "male"]

//emptyDictionary : ["Key"] = "value"
// let someValue : String = initalizeddictionary["name"] 상수선언이기때문에 수정 불가능

// 빈 Int Set  생성
//set : 순서가 중요하지 않거나, 항목이 한번만 표시되도록 해야하는 경우 배열 대신 집합을 사용할 수 있겠다.배열과 달리 중복 요소를 허용하지 않고, 해시를 통해 값을 저장하기 때문에 배열에 비해 검색속도가 빠르다.

var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)

integerSet
integerSet.contains(1)
integerSet.contains(2)

integerSet.remove(100)
integerSet.removeFirst()

integerSet.count

let setA: Set<Int> = [1,2,3,4,5]
let setB: Set<Int> = [3,4,5,6,7]

let union : Set<Int> = setA.union(setB) //합집합 union

let sortedUnion: [Int] = union.sorted()// 정렬 sorted

let intersection: Set<Int> = setA.intersection(setB)//교집합

let subtracting: Set<Int> = setA.subtracting(setB)// 차집합

