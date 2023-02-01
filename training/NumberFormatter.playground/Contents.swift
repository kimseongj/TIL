import UIKit

let numberFormatter = NumberFormatter()
numberFormatter.number(from: "123456")


numberFormatter.numberStyle = .decimal
numberFormatter.maximumFractionDigits = 7
let price = 12345678.12345678
let result = numberFormatter.string(for: price)!
print(result) //12,345,678.1234567
result is String
