//: [Previous](@previous)

import Foundation


var slackAPI = SlackAPI(token: "ADD-YOUR-TOKEN")

slackAPI.getConversations { conversations in
    print("Conversations \(String(describing: conversations))")
}

//: [Next](@next)
