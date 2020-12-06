import Foundation

struct ChannelsDataModel: Decodable {
    let ok: Bool
    let channels: [ChannelDataModel]
}

struct ChannelDataModel: Decodable {
    let id: String
    let name: String
    let creator: String
}

final class APIClient {
    func getSlackChannels(completionBlock: @escaping (ChannelsDataModel) -> ()) {
        let url = URL(string: "https://slack.com/api/conversations.list?token=xoxb-1314965010803-1498101718961-mXey0PS6v41QfztMvJTJhQKb")!
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            let dataModel = try! JSONDecoder().decode(ChannelsDataModel.self, from: data!)
            completionBlock(dataModel)
        }
        task.resume()
    }
}

let apiClient = APIClient()
apiClient.getSlackChannels {
    print("DataModel \($0)")
}
