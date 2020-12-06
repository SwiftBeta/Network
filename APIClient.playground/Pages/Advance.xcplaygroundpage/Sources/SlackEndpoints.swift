import Foundation

enum SlackEndpoints {
    case getConversations
    
    public var endpoint: Endpoint {
        switch self {
        case .getConversations:
            return GetConversationsEndpoint()
        }
    }
}
