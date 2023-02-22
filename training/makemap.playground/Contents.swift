import UIKit



extension Array {
    func myMap(method: (Element) -> Element) -> [Element] {
        var result: [Element] = []
        self.forEach { element in
            result.append(method(element))
        }
        
        return result
    }
    
    func myFilter(method: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        self.forEach { element in
            if method(element) == true {
                result.append(element)
            }
        }
        return result
    }

//    func customReduce(_ initialValue: Element, method: (Element, Element) -> Element) {
//        var result: [Element] = []
//        self.forEach { }
//
//    }
}
 
print([1, 2, 3, 4].myMap { $0 + 1 })
print([1, 2, 3, 4].myFilter { $0 % 2 == 0 })



