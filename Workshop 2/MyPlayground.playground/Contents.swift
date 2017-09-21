//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var optionalString: String? = nil
print(optionalString)

optionalString = "Hello!"
print(optionalString)

// good, safe, cool
if let string = optionalString {
    print(string)
} else {
    print("optionalString was empty")
}

//optionalString = nil

// bad, unsafe, not cool
print(optionalString!)

