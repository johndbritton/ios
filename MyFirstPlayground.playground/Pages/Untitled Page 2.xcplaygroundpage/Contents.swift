struct Point {
    var x: Float
    var y: Float
}

class Person {
    var name: String {
        willSet(oldValue){
            print(oldValue)
        }
        
        didSet(newValue){
            print(newValue)
        }
    }
    
    func walk() {
        print("Walking...")
    }
    
    func sing(song: String) -> String {
        print(song)
        return song
    }
    
    func sing(song: String, multipleTimes times: Int) -> (String, Int) {
        for _ in 0 ..< times {
            sing(song)
        }
        
        return (song, times)
    }

    var lastName: String
    var fullName: String {
        return name + " " + lastName
    }
    
    init(name: String, lastName: String) {
        self.name = name
        self.lastName = lastName
    }
}

let p = Point(x: 100, y: 50)
p.x

let person = Person(name: "John", lastName: "Britton")
person.name
person.lastName
person.fullName

person.name = "bob"
person.walk()

person.sing("foo")
person.sing("foo", multipleTimes: 5)

