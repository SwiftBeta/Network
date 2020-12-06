import Foundation

public protocol SlackAPIProtocol {
    func getConversations()
}

public final class SlackAPI {
    private let token: String
    private let api: API
        
    public init(token: String) {
        self.token = token
        self.api = API(requester: Requester(token: token))
    }
    
    public func getConversations(completionBlock: @escaping (ConversationsDataModel?) -> ()) {
        let endpoint = SlackEndpoints.getConversations.endpoint
        let conversationsEndpoint = api.router.routeSlackEndpoint(endpoint)
        api.requester.execute(with: conversationEndpoint) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let data):
                let dataModel = strongSelf.api.parser.parse(data, type: ConversationsDataModel.self, decoder: JSONDecoder.init())
                completionBlock(dataModel)
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
}
