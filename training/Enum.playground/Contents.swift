import UIKit

enum Family {
    case father
    case mother
    case brother
    case me
}

func greet(family: Family) {
    print("Hi! \(family)")
}

greet(family: Family.father)

enum Food: String {
    case hamburger = "햄버거"
    case chicken = "치킨"
    case pizza = "피자"
}

func chooseMenu(food: Food) {
    print("\(food.rawValue)를 골랐습니다.")
}

chooseMenu(food: Food.pizza)




