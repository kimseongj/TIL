import UIKit
import Combine

//class Weather {
//    @Published var temperature: Double
//    init(temperature: Double) {
//        self.temperature = temperature
//    }
//
//    var cancellables: Set<AnyCancellable> = []
//
//    let weather = Weather(temperature: 20)
//    var cancellables = weather.$temperature
//        .sink() {
//            print ("Temperature now: \($0)")
//    }
//}


//weather.temperature = 25

class Weather {
    @Published var temperature: [Double]
    init(temperature: [Double]) {
        self.temperature = temperature
    }
}

var cancellables: Set<AnyCancellable> = []

let weather = Weather(temperature: [20])
weather.$temperature
    .sink() {
        print ("Temperature now: \($0)")
    }.store(in: &cancellables)
weather.temperature = [25]

weather.temperature.append(14)
