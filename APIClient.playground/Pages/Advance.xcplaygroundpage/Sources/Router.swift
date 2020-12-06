import Foundation

public protocol RouterProtocol {
    func routeSlackEndpoint(_ endpoint: Endpoint) -> Endpoint
}

public final class Router: RouterProtocol {
    private struct RouterEndpoint: Endpoint {
        let path: String
        let method: HTTPMethod
        var parameters: [String: AnyObject]?
    }
    
    private let environment: AppEnvironment
    
    public init(environment: AppEnvironment = AppEnvironment()) {
        self.environment = environment
    }
    
    public func routeSlackEndpoint(_ endpoint: Endpoint) -> Endpoint {
        routeEndpoint(endpoint, api: .slack)
    }
    
    private func routeEndpoint(_ endpoint: Endpoint, api: AppEnvironment.Base) -> Endpoint {
        var url = environment.getUrl(api: api)
        url.appendPathComponent(endpoint.path)
        return RouterEndpoint(path: url.absoluteString,
                              method: endpoint.method,
                              parameters: endpoint.parameters)
    }
}
