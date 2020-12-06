import UIKit

let urlSessionConfiguration = URLSessionConfiguration.default
let urlSession = URLSession(configuration: urlSessionConfiguration)
let session = URLSession.shared
let url = URL(string: "https://itunes.apple.com/search/media=music&entity=song&term=avicii")

urlSession.dataTask(with: url!) { data, response, error in
    print("Data \(String(describing: data))")
    print("Response \(String(describing: response))")
    print("Error \(String(describing: error))")
}.resume()

let urlRequest = URLRequest(url: url!)

urlSession.dataTask(with: urlRequest) { data, response, error in
    print("Data \(String(describing: data))")
    print("Response \(String(describing: response))")
    print("Error \(String(describing: error))")
}.resume()

