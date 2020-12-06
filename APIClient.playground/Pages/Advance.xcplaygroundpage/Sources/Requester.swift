import Foundation

public protocol RequesterProtocol {
    func execute(with endpoint: Endpoint, completionBlock: @escaping (Result<Data, Error>) -> ())
}

public final class Requester: RequesterProtocol {
    private let urlSession: URLSession
    private let token: String
    
    public init(urlSession: URLSession = URLSession.shared,
                token: String = "") {
        self.urlSession = urlSession
        self.token = token
    }
    
    public func execute(with endpoint: Endpoint, completionBlock: @escaping (Result<Data, Error>) -> ()) {
        let urlRequest = buildURLRequest(endpoint: endpoint)!
        
        let task = urlSession.dataTask(with: urlRequest) {
            data, response, error in
            guard let error = error else {
                completionBlock(.success(data!))
                return
            }
            completionBlock(.failure(error))
        }

        task.resume()
    }
    
    private func buildURLRequest(endpoint: Endpoint) -> URLRequest? {
        var urlRequest = URLRequest(url: URL(string: endpoint.path)!)
        urlRequest.httpMethod = endpoint.method.rawValue
                
        if let parameters = endpoint.parameters,
            !parameters.isEmpty,
            let postData = (try? JSONSerialization.data(withJSONObject: endpoint.parameters as Any, options: [])) {
            urlRequest.httpBody = postData
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return urlRequest
    }
}
