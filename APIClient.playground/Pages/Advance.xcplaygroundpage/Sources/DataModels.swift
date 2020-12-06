import Foundation

public struct ConversationsDataModel: Decodable {
    let ok: Bool
    let conversations: [ConversationDataModel]
}

public struct ConversationDataModel: Decodable {
    let id: String
    let name: String
    let creator: String
}
