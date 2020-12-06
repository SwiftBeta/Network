import Foundation

public protocol ParserProtocol {
    func parse<T: Decodable>(_ data: Data, type: T.Type, decoder: JSONDecoder) -> T?
}

public final class Parser: ParserProtocol {
    public init() { }
    
    public func parse<T: Decodable>(_ data: Data, type: T.Type, decoder: JSONDecoder = .init()) -> T? {
        do {
            return try decoder.decode(T.self, from: data)
        } catch let error as DecodingError {
            printDecodable(error: error)
        } catch {
            print("Error \(error)")
        }
        return nil
    }
}

public extension Parser {
    func printDecodable(error: Error) {
        guard let error = error as? DecodingError else { return }
        let message: String
        switch error {
        case .keyNotFound(let key, let context):
            message = "[Decodable] Key \"\(key)\" not found \nContext: \(context.debugDescription)"
        case .dataCorrupted(let context):
            message = "[Decodable] Data corrupted \n(Context: \(context.debugDescription)) \nCodingKeys: \(context.codingPath)"
        case .typeMismatch(let type, let context):
            message = "[Decodable] Type mismatch \"\(type)\" \nContext: \(context.debugDescription)"
        case .valueNotFound(let type, let context):
            message = "[Decodable] Value not found, type \"\(type)\" \nContext: \(context.debugDescription)"
        @unknown default:
            message = "[Decodable] Unknown DecodingError catched"
            assertionFailure(message)
        }
        print(message)
    }
}
