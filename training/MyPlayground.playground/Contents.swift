import UIKit

class Bank {
    @objc dynamic var jango: Int = 100
}

class BankManager {
    @objc var bank: Bank
    var observation: NSKeyValueObservation?
    
    init(bank: Bank) {
        self.bank = bank
        observation = observe(\.bank.jango,)
    }
}

let hankookBank: Bank = Bank()
let manager: BankManager = BankManager(bank: hankookBank)

hankookBank.jango = 99





class Teacher {
    func callStudent() {
        let noti = Notification(name: Notification.Name.hey) // Notification.Name. Notification.Name("hey")
        NotificationCenter.default.post(noti) // Notification(name: Notification.Name.hey)
    }
}

class Student {
    let name: String
    
    init(name: String) {
        self.name = name
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(answerToTeacher(noti:)),
                                               name: Notification.Name.hey, object: nil)
    }
    
    @objc func answerToTeacher(noti: Notification) {
        print("Ok Teacher I'm coming. My name is \(name)")
    }
}

extension Notification.Name {
    static let hey = Notification.Name("hey") // hey는 class : 싱글톤

    static let bye = Notification.Name("bye")
   
}

let yagom = Teacher()

let kane = Student(name: "kane")
let james = Student(name: "james")
let tak = Student(name: "tak")

yagom.callStudent()


// Notification.Name은 NSNotification.Name의 typealias이다.
