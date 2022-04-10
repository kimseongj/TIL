import Swift

//MARK :- Class vs Struct/Enum

struct ValueType {
    var property = 1
}

class ReferenceType {
    var property = 1
}

let firstStructInstance = ValueType() //1
var secondStructInstance = firstStructInstance //2 >> 이 과정에서 복사가 되는 것임 값타입이기 때문
secondStructInstance.property = 2

print("first struct instace property : \(firstStructInstance.property)")
print("second struct instance property : \(secondStructInstance.property)")

let firstClassReference = ReferenceType() //2
var secondClassReference = firstClassReference //2 >> 이 과정에서 그 값이 참조되어 값에 들어감 참조타입이기 때문
secondClassReference.property = 2

print("\(firstClassReference)")
print("\(secondClassReference)")

struct SomeStruct {
    var someProperty : String = "Property"
}
var someStructInstance: SomeStruct = SomeStruct()

func someFunction(structInstance: SomeStruct) {
    var localVar: SomeStruct = structInstance
    localVar.someProperty = "ABC"
}

someFunction(structInstance: someStructInstance)
print(someStructInstance.someProperty)




class SomeClass {
    var someProperty: String = "Property"
}
var someClassInstance: SomeClass = SomeClass()

func someFunction(classInstance: SomeClass) {
    var localVar: SomeClass = classInstance
    localVar.someProperty = "ABC"
}

someFunction(classInstance: someClassInstance)
print(someClassInstance.someProperty)
