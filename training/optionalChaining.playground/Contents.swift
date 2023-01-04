import Foundation

class Human {
    var age: Age?
    
}

class Age {
    var age1 = 30
}

var kim = Human()

kim.age = Age()

let checkNil = kim.age?.age1
