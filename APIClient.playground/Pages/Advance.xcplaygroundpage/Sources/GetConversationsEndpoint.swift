import Foundation

public struct GetConversationsEndpoint: Endpoint {
    public var path: String = "/conversations.list"
    public var method: HTTPMethod = .GET
    public var parameters: [String : AnyObject]? = nil
    
    public init() { }
}
