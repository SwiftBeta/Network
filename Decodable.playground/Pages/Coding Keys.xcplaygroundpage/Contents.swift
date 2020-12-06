//: [Previous](@previous)

import Foundation

let data = """
{
    "name_of_user": "SwiftBeta",
    "age": 30
}
""".data(using: .utf8)!

struct User: Codable {
    let name: String
    let age: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "name_of_user"
        case age
    }
}

let user = try? JSONDecoder().decode(User.self, from: data)
user?.name

//: [Next](@next)
