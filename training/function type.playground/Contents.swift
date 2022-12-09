//MARK: 함수를 타입으로 받기


import UIKit

func greet(me: String, friend: String) {
    print("안녕 \(friend)야! 나는 \(me)야!")
}

func copy(function: (String, String) -> Void) {
    function("Kim", "Park")
}

copy(function: greet(me:friend:))


