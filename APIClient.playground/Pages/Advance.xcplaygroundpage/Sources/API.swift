import Foundation

public final class API {
    let requester: RequesterProtocol
    let parser: ParserProtocol
    let router: RouterProtocol
    
    public init(requester: RequesterProtocol = Requester(),
         parser: ParserProtocol = Parser(),
         router: RouterProtocol = Router()) {
        self.requester = requester
        self.parser = parser
        self.router = router
    }
}
