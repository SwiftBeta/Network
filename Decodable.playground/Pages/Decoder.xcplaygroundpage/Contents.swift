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
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
    }
}

extension User {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
    }
}

let user = try JSONDecoder().decode(User.self, from: data)
user.name
//: [Next](@next)
