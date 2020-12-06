//: [Previous](@previous)

import Foundation

let data = """
{
    "name": "SwiftBeta",
    "age": 30
}
""".data(using: .utf8)!

struct User: Codable {
    let name: String
    let age: Int
}

let user = try? JSONDecoder().decode(User.self, from: data)
user?.name 

//: [Next](@next)
