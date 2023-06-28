protocol Component {
    var name: String { get set }
    var price: Int { get set }
    
    func getPrice() -> Int
}


class Product: Component {
    var name: String
    var price: Int
    
    func getPrice() -> Int {
        return self.price
    }
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}
