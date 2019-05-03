import UIKit

var str = "Hello, playground"



extension Array where Element: Hashable {
    
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    func hasDuplicatedElement() -> Bool {
        var addedDict = [Element: Bool]()
        
        let newArray = filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
        
        if newArray.count < self.count {
            return true
        } else {
            return false
        }
        
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}


struct Category: Equatable, Hashable {
    
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    var hashValue: Int {
        return 0.hashValue
    }
    
    var id: String = ""
    var name: String = ""
    
}

let category1 = Category(id: "1", name: "phuoc1")
let category2 = Category(id: "2", name: "phuoc1")
let category3 = Category(id: "3", name: "phuoc3")
let categoryDuplicate =  Category(id: "1", name: "phuoc1")


var arrayObject: [Category] = [category1,category1,category1]
print(arrayObject.hasDuplicatedElement())
