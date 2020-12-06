//: [Previous](@previous)

import Foundation

let data = """
[{
    "name": "Swift",
    "age": 20
  },
  {
    "name": "Beta",
    "age": 30
  },
    {
    "name": "Blog",
    "age": 20
  },
  {
    "name": "iOS",
    "age": 30
  }
]
""".data(using: .utf8)!

struct User: Codable {
    let name: String
    let age: Int
}

let users = try JSONDecoder().decode([User].self, from: data)

users.forEach { user in
    print("User name: \(user.name)")
}

//: [Next](@next)
