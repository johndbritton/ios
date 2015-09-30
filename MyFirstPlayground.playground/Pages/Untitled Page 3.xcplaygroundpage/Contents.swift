class Animal {
    var canWalk: Bool
    var type: String
    
    init(type: String, canWalk: Bool) {
        self.canWalk = canWalk
        self.type = type
    }
    
    convenience init(type: String){
        self.init(type: type, canWalk: true)
    }
    
    func run() {
        print("Running...")
    }
}

class Dog: Animal {
    var numberOfLegs: Int
    
    init() {
        self.numberOfLegs = 4
        super.init(type: "Dog", canWalk: true)
    }
    
    convenience init(type: String) {
        self.init()
    }
}

let animal = Animal(type: "Bird", canWalk: true)
let animal2 = Animal(type: "Fish")
let dog = Dog()
