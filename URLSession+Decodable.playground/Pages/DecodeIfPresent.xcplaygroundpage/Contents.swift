//: [Previous](@previous)

import Foundation

let data = """
{
    "name": "Loop Infinito"
}
""".data(using: .utf8)!

struct User: Codable {
    let name: String
    let age: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        age = try container.decodeIfPresent(Int.self, forKey: .age)
    }
}

let user = try JSONDecoder().decode(User.self, from: data)
user.age
//: [Next](@next)
