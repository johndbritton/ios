//: Playground - noun: a place where people can play

var name: String? = "John"

var age: Double = 34234232342

var truth: Bool = false

let names: [String] = ["John", "Bob", "Tom"]

var cars = [String]()

cars.append("BMW")
cars.append("Ferrari")
cars.insert("Volvo", atIndex: 0)
cars.removeAtIndex(0)
cars

var person: [String:Double] = ["Age": 30, "Height": 1.8]
person["Weight"] = 50
person
person.removeValueForKey("Age")
person

var food = [String:String]()
food["Fruit"] = "Apple"
food

let shapes: Set<String> = ["Circle", "Square"]

