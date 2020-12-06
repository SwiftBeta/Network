import Foundation

public class AppEnvironment {
    public enum Base {
        case slack
    }
    
    public init() { }
            
    public func getUrl(api: Base) -> URL {
        switch api {
        case .slack:
            return URL(string: "https://slack.com/api")!
        }
    }
}
