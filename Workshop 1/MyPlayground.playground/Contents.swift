//: Playground - noun: a place where people can play

import UIKit

// Swift Major Themes
// 1. Safety
// 2. Clarity
// 3. Conciseness

var str = "Hello, playground"
str = "Goodbye, cruel world."
print(str)
// str = 42 // doesn't work, str has to be a String


let pi = 3.14
// pi = 1 // doesn't work, pi is a constant


let e: Double = 2.72
let theMeaningOfLife: Int = 42

// Classes aren't required to subclass another class
class Animal {
    var species = ""
}

class Person {
    
}

// Cat is a subclass of Animal
class Cat: Animal {
    var name = ""
    
    init(name: String) {
        self.name = name
    }
    
    func purr() {
        print("Purr!")
    }
    
    func bite(person: Person) {
        print("Monch!")
    }
    
    func isHappy() -> Bool {
        return false // cats are mean
    }
}

let myCat = Cat(name: "Garfield")
myCat.species = "Feline"
myCat.purr()
myCat.bite(person: Person())
let catIsHappy = myCat.isHappy()

// 0-5 exclusive (of 5)
for n in 0..<5 {
    print(n)
}

// 0-5 inclusive
for n in 0...5 {
    print(n)
}

if myCat.isHappy() {
    print("The cat is happy.")
}

// Curly brackets required
//if myCat.isHappy()
//    print("The cat is happy–but Swift isn't.")
