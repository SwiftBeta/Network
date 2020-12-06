import UIKit

struct SearchResponseDataModel: Decodable {
    let resultCount: Int
    let results: [TrackDataModel]
}

struct TrackDataModel: Decodable {
    let artistId: Int
    let kind: String?
    let name: String?
    let artistName: String
    let artworkURL: String
    
    enum CodingKeys: String, CodingKey {
        case artistId
        case kind
        case name = "trackName"
        case artistName = "artistName"
        case artworkURL = "artworkUrl60"
    }
}
    
final class APIClient {
    func searchTracksOnItunes(completionBlock: @escaping ([TrackDataModel]) -> ()) {
        // 1
        let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson")!
        // 2
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            // 3
            let dataModel = try! JSONDecoder().decode(SearchResponseDataModel.self, from: data!)
            completionBlock(dataModel.results)
        }
        // 4
        task.resume()
    }
}

let apiClient = APIClient()
apiClient.searchTracksOnItunes {
    print("DataModel \($0)")
} 
