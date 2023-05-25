import UIKit
import Combine

class Weather {
    @Published var temperature: [Double]
    init(temperature: [Double]) {
        self.temperature = temperature
    }
}

var cancellables: Set<AnyCancellable> = []

let weather = Weather(temperature: [])
weather.$temperature
    .sink() {_ in
        print("sinkStart")
        print ("Temperature now: \(weather.temperature)")
        print("sinkFinish")
    }.store(in: &cancellables)

print("25start")
weather.temperature = [25]
print("25finish")

weather.temperature.append(14)
