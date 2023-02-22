import UIKit
import Combine

let firstPulbisher = Just("kim")

let subscriber1 = firstPulbisher.sink { value in
    print(value)
}

//sink메소드가 subscriber를 만든다

let subscriber2 = firstPulbisher.sink(receiveCompletion: { result in
    switch result {
    case .finished:
        print("finished")
    case .failure(let error):
        print(error.localizedDescription)
    }
}, receiveValue: { value in
    print(value)
    
})

let secondPublisher = Just("kim")
secondPublisher.subscribe(<#T##subscriber: Subscriber##Subscriber#>)
// subscribe 메서드가 subscriber와 publisher를 연결시켜준다.

class ParkSubscriber: Subscriber {
    //subscriber에게 publisher를 성공적으로 구독했음을 알리고 item을 요청할 수 있음
    // 매개변수 타입 Subscription은 프로토콜로 publisher와 subscriber간의 연결을 나타내는 말그대로 "구독"이다.
    func receive(subscription: Subscription) {
        print("구독 시작")
        subscription.request(.unlimited
        )
    }
    
    //subscriber에게 publisher가 element를 생성했음을 알림
    func receive(_ input: String) -> Subscribers.Demand {
        print("\(input)")
        return .none
    }
    
    //subscriber에게 publisher가 정상적으로 또는 오류로 publish를 완료했음을 알림
    func receive(completion: Subscribers.Completion<Never>) {
        <#code#>
    }
    
    typealias Input = String
    
    typealias Failure = Never
    
    
}
 //Input에서 Subscriber가 받을 데이터 타입을 정의
// Failure는 Subsriber가 받을 수 있는 에러의 종류
// Subscriber가 error를 받을 수 없는 경우를 Never라고 사용
