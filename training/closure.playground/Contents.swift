import UIKit

class Character {
    var hp: Int = 100
    var mp: Int = 100
    
    let fireBall: () -> Void = { print("앗 뜨거") }
    let magicClaw: () -> Void = { print("앗 따거") }
    let heal: () -> Void = { print("아싸") }

}

func tabShiftKey(skill: () -> Void) {
    skill()
}

let character = Character()

tabShiftKey(skill: character.fireBall)

extension Array {
    func myReduce<T> (_ initializedValue: T, method: (T, Element) -> T) -> T {
        var result = initializedValue
        for element in self {
            result = method(result, element)
        }
        return result
    }
}

print([1,2,3,4,5].myReduce(0, method: { $0 + $1 }))
