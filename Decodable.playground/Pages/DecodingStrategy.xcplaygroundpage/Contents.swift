//: [Previous](@previous)

import Foundation

let data = """
{
    "type_vehicle": "Car",
    "num_doors": 4
}
""".data(using: .utf8)!

struct Vehicle: Codable {
    let typeVehicle: String
    let numDoors: Int
}

let jsonDecoder = JSONDecoder()
jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

let vehicle = try jsonDecoder.decode(Vehicle.self, from: data)
vehicle.typeVehicle

//: [Next](@next)
